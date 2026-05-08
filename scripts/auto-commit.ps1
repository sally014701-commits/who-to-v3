param(
  [int]$IntervalSeconds = 30,
  [string]$CommitPrefix = "auto",
  [int]$MaxCommits = 0  # 0 = unlimited
)

$ErrorActionPreference = "Stop"

function Test-GitUserIdentity {
  $name = git config --get user.name 2>$null
  $email = git config --get user.email 2>$null
  if ([string]::IsNullOrWhiteSpace($name) -or [string]::IsNullOrWhiteSpace($email)) {
    throw "git 사용자 정보가 설정되어 있지 않습니다. 실행: git config --global user.name '이름' 과 git config --global user.email '이메일' 설정 후 다시 실행하세요."
  }
}

function Has-WorkingTreeChanges {
  $porcelain = git status --porcelain=v1
  return -not [string]::IsNullOrWhiteSpace($porcelain)
}

Test-GitUserIdentity

$commitsMade = 0
Write-Host "Auto-commit started. Interval=$IntervalSeconds sec, Prefix='$CommitPrefix'."
Write-Host "Remote push is NOT performed by this script."

while ($true) {
  try {
    if (Has-WorkingTreeChanges) {
      # Stage everything that is not ignored (.gitignore)
      git add -A

      # If there is something staged, create a commit.
      git diff --cached --quiet
      $diffExitCode = $LASTEXITCODE  # 0: no diff, 1: diff exists
      if ($diffExitCode -ne 0) {
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $msg = "${CommitPrefix}: $timestamp"
        git commit -m $msg
        $commitsMade++
        Write-Host "Committed ($commitsMade)."

        if ($MaxCommits -gt 0 -and $commitsMade -ge $MaxCommits) {
          break
        }
      }
    }
  }
  catch {
    Write-Host "Auto-commit error: $($_.Exception.Message)"
    # Keep running; next iteration may recover (e.g., temporary git lock).
  }

  Start-Sleep -Seconds $IntervalSeconds
}

Write-Host "Auto-commit stopped."

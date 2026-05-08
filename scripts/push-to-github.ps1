param(
  [string]$Remote = "origin",
  [string]$Branch = "main"
)

$ErrorActionPreference = "Stop"

Write-Host "Pushing to $Remote $Branch ..."
git push $Remote $Branch
Write-Host "Push complete."

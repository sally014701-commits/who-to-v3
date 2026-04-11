#!/bin/bash
# Resend API 키 설정 + Functions 배포
# 사용법: ./scripts/setup-resend-and-deploy.sh
#
# 1. firebase login (브라우저 인증 필요)
# 2. RESEND_API_KEY Secret 설정
# 3. firebase deploy --only functions

set -e
cd "$(dirname "$0")/.."

echo "=== Firebase Functions 배포 ==="
echo "RESEND_API_KEY Secret을 먼저 설정하고 배포합니다."
echo

if ! command -v firebase &>/dev/null; then
  echo "Firebase CLI가 없습니다. 설치: npm install -g firebase-tools"
  echo "또는: npx firebase-tools deploy --only functions"
  exit 1
fi

echo "1) Secret 설정: RESEND_API_KEY"
firebase functions:secrets:set RESEND_API_KEY
echo

echo "2) Functions 배포"
firebase deploy --only functions

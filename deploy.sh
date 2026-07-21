#!/bin/sh
# iCloud 원본 → 이 저장소로 복사하고 푸시한다.
set -e

SRC="$HOME/Library/Mobile Documents/com~apple~CloudDocs/01. psw95/01. Brand Island/PSW-BI-15-인스턴트 디제이/개발"
DST="$(cd "$(dirname "$0")" && pwd)"

cp "$SRC/index.html" "$DST/index.html"
cp "$SRC/spike.html" "$DST/spike.html"

cd "$DST"
if git diff --quiet; then
  echo "바뀐 게 없어."
  exit 0
fi

git add -A
git commit -m "${1:-update}"
git push

echo
echo "배포됨 → https://psw95perrykim-kr.github.io/PSW-BI-15/"
echo "반영까지 30초~1분쯤 걸려."

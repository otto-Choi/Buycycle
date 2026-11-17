#!/usr/bin/env bash
# Stop 훅: docs/log.md보다 나중에 수정된 파일이 있으면 로그 갱신 전까지 종료를 막는다.
cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0

# 재차단 무한 루프 방지
if cat | grep -q '"stop_hook_active"[[:space:]]*:[[:space:]]*true'; then
  exit 0
fi

[ -f docs/log.md ] || exit 0

changed=$(find . \( -path ./.git -o -path ./node_modules -o -name settings.local.json \) -prune -o \
  -type f -newer docs/log.md ! -path ./docs/log.md -print | head -5)

if [ -n "$changed" ]; then
  echo "docs/log.md가 최근 수정된 파일보다 오래됐습니다. 작업 내용을 log.md에 기록하세요. 변경된 파일:" >&2
  echo "$changed" >&2
  exit 2
fi
exit 0

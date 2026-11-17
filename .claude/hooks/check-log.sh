#!/usr/bin/env bash
# Stop 훅: Claude가 수정한 파일이 있는데(.log-pending) docs/log.md가 그보다 오래됐으면 종료를 막는다.
cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0

# 재차단 무한 루프 방지
if cat | grep -q '"stop_hook_active"[[:space:]]*:[[:space:]]*true'; then
  exit 0
fi

[ -f .claude/.log-pending ] && [ -f docs/log.md ] || exit 0

if [ .claude/.log-pending -nt docs/log.md ]; then
  echo "Claude가 파일을 수정했지만 docs/log.md가 갱신되지 않았습니다. 작업 내용을 log.md에 기록하세요." >&2
  exit 2
fi
exit 0

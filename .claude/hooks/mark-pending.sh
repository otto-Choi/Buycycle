#!/usr/bin/env bash
# PostToolUse(Edit|Write) 훅: Claude가 프로젝트 안의 파일을 수정하면 로그 기록 대기 표식을 갱신한다.
# docs/log.md 자체와 프로젝트 밖 파일(계획 파일 등)은 무시한다.
cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0
python -c '
import os, sys, json
try:
    path = json.load(sys.stdin).get("tool_input", {}).get("file_path", "")
except Exception:
    sys.exit(1)
if not path:
    sys.exit(1)
root = os.path.normcase(os.path.abspath("."))
p = os.path.normcase(os.path.abspath(path))
log = os.path.normcase(os.path.join(root, "docs", "log.md"))
sys.exit(0 if p.startswith(root + os.sep) and p != log else 1)
' && touch .claude/.log-pending
exit 0

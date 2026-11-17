# 작업 로그

수행한 모든 수정과 작업을 시간순으로 기록한다. 최신 항목을 맨 아래에 추가한다.

형식: `## YYYY-MM-DD` 아래에 `- 작업 내용` 한 줄씩.

## 2026-11-17
- GitHub 원격(`otto-Choi/Buycycle`, main) 연결, 로컬 git 초기화
- 디렉토리 구조 생성: docs, data, input, output, memory, .claude/{rules,skills}
- `.gitignore`, `.gitkeep` 추가
- `memory/memory.md` 인덱스 생성, `CLAUDE.md`에서 참조
- 프론트/백엔드 분리 구조로 개편: `frontend/src/components`, `backend/src/{api,models}`, `package/` 제거
- `docs/log.md`, `docs/decisions.md` 생성
- `.claude/rules/documentation.md` 생성 (log, decisions, memory 작성 규칙)
- `.claude/settings.json`(권한: .env 읽기 차단, Stop 훅), `.claude/hooks/check-log.sh` 추가
- `.claude/agents/code-reviewer.md`, `.mcp.json`(빈 설정), `.claude/rules/{frontend,backend}.md`(paths frontmatter) 추가
- `docs/decisions.md`에 D-003(Stop 훅으로 log 강제) 추가

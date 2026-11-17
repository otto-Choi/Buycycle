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
- 불필요한 `docs/.gitkeep` 삭제, `README.md` 추가
- `docs/plan.md` 작성(구현 계획), `README.md`와 `CLAUDE.md`에 프로젝트 설명 추가
- Stop 훅을 Claude의 Edit/Write 기준으로 변경(mark-pending.sh, check-log.sh, settings.json), D-004 추가, plan.md의 ISA 결정 번호를 D-005로 조정
- mark-pending.sh의 stdin 처리 버그 수정
- mark-pending.sh를 stdin 직접 읽는 방식으로 재수정 후 테스트 통과
- 훅 테스트 입력 문제(echo의 백슬래시 처리)를 확인하고 printf로 재검증, 통과
- 훅 테스트를 python으로 생성한 JSON 입력으로 재검증
- 예시로 만든 `.claude/agents/code-reviewer.md` 삭제 (현재 불필요)
- `docs/claude-workflow.md` 작성(Sonnet/Opus 운영, compact·handoff 절차, 예정 훅), `docs/decisions.md`에 D-006 추가. 훅과 설정은 구현하지 않음
- `.claude/rules/coding-style.md`(주석 규칙) 작성, `docs/decisions.md`에 D-007 추가

# Claude 활용 계획

두 세션으로 구현한다. 이 문서는 운영 방식을 정리한 것이며, 아래 "예정" 항목은 아직 구현하지 않았다.

## 역할 분담
| 세션 | 용도 |
|------|------|
| Sonnet (Medium) | 작성과 구현 대부분 |
| Opus (High) | 단계 종료 시 리뷰, 독립 검토. 특히 주문/금액/안전장치 코드 |

## 컨텍스트 운영
컨텍스트가 커지거나 구현 단계가 끝나면 다음 순서로 진행한다.
1. 결정은 `docs/decisions.md`, 배운 내용은 `memory/<주제>.md`에 먼저 기록한다.
2. 인수인계 문서를 작성한다(`/handoff` 스킬, 출력 위치 `memory/handoff.md`).
3. `/compact`를 실행한다.
4. 압축 후 세션이 인수인계 문서를 읽고 이어서 작업한다.

## 인수인계 자동화 (예정)
- 훅은 셸 명령만 실행하므로 스킬을 호출하거나 Claude가 글을 쓰게 할 수 없다. "compact 전에 handoff를 훅으로 건다"는 그대로는 불가능하다.
- 따라서 2단으로 구성한다.
  - **작성은 수동**: compact 직전에 사용자가 `/handoff`를 실행한다.
  - **전달은 자동**: `SessionStart` 훅(matcher `compact`)이 compact 직후 `memory/handoff.md`를 컨텍스트에 주입한다.
- 선택: `PreCompact` 훅으로 handoff가 오래됐을 때 경고만 한다. 자동 compact를 막으면 작업이 멈출 수 있어 차단하지 않는다. 지원 여부는 구현 시 확인한다.
- `memory/handoff.md`는 매번 덮어쓰는 임시 파일이므로 git에서 제외하고 `memory/memory.md` 목록에도 넣지 않는다.

## Opus 리뷰 절차
- 입력: `docs/plan.md`, `docs/decisions.md`, `git diff`
- **handoff는 넘기지 않는다.** Sonnet의 판단과 맥락을 물려받으면 독립 검토의 의미가 사라진다.
- 결과는 `docs/log.md`에 요약하고, 결정이 바뀌면 `docs/decisions.md`에 새 항목으로 추가한다.

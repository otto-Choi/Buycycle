# Buycycle

한국투자증권(KIS) Open API로 ISA 계좌의 ETF를 매달 초 목표 비중에 맞춰 자동 매수하는 시스템.

- 스택: Python(FastAPI), SQLite + SQLAlchemy, React, OS 스케줄러
- 월 기본 투자금 150만원, 여윳돈 추가 납입 가능
- 매수는 목표 비중에 부족한 종목부터 채우는 방식(매도 없음)
- 매수 계획, 매수 직전, 체결을 텔레그램으로 알림
- 기본은 모의투자. 실전 전환은 명시적 설정으로만 가능
- 구현 단계는 [docs/plan.md](docs/plan.md) 참고

## 디렉토리 구조

```
Buycycle/
├── frontend/src/components/   프론트엔드 소스
├── backend/src/{api,models}/  백엔드 소스
├── data/                      데이터
├── input/                     입력 파일
├── output/                    산출물
├── docs/                      문서 (작업 로그, 의사결정 기록)
├── memory/                    프로젝트 기록 (memory.md가 목차)
└── .claude/                   Claude Code 설정 (rules, skills)
```

## 문서

- [구현 계획](docs/plan.md): 단계별 구현 계획
- [작업 로그](docs/log.md): 수행한 모든 작업의 기록
- [의사결정 기록](docs/decisions.md): 결정의 근거
- [메모리 목차](memory/memory.md): 주제별 기록 모음

## 작업 규칙

문서화 규칙은 [.claude/rules/documentation.md](.claude/rules/documentation.md)를 따른다.

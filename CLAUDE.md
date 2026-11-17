@memory/memory.md

# Buycycle

한국투자증권(KIS) Open API로 ISA 계좌의 ETF를 매달 초 목표 비중에 맞춰 자동 매수하는 시스템.
Python(FastAPI), SQLite + SQLAlchemy, React, OS 스케줄러(API 서버와 작업 명령 분리). 월 기본 150만원, 여윳돈 추가 납입 가능. 매수 계획/직전/체결을 텔레그램으로 알림.

- 계획과 단계: [docs/plan.md](docs/plan.md)
- 작업 로그: [docs/log.md](docs/log.md), 의사결정: [docs/decisions.md](docs/decisions.md)
- 주문 관련 코드는 기본값을 항상 모의투자/dry-run으로 둔다. 실전은 명시적 전환만 허용.
- 가장 작은 단위부터 구현하고 단계별로 확장한다.

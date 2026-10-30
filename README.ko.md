# Superpower Light

[English](README.md)

Superpower Light는 [obra/superpowers](https://github.com/obra/superpowers)를 기반으로 독립적으로 수정한 MIT 라이선스 프로젝트입니다. 코딩 에이전트용 스킬 14개를 담고 있으며, 적용 조건을 좁히고 작업의 불확실성과 영향에 맞춰 절차를 선택하도록 바꿨습니다.

변경 사항은 각 스킬의 지침, 참조 문서, 프롬프트, 보조 스크립트에 직접 반영되어 있습니다. 원본 위에 별도의 사용자 선호 파일만 덧붙인 구성이 아닙니다.

## 달라진 기본 동작

| 작업 | 기본 접근 |
| --- | --- |
| 요구사항이 명확한 문구·스타일·작은 UI 수정 | 관련 내용을 읽고 바로 수정·검증합니다. |
| 요구사항이 정해진 일반 기능 개발 | 채팅에 짧은 계획을 남기고 현재 작업 공간에서 구현합니다. |
| 설계가 모호하거나 보안·데이터·호환성·동시성 영향이 큰 변경 | 중요한 미결정을 해결하고 필요한 계획과 독립 리뷰를 적용합니다. |
| 원인이 불명확한 실패 | 수정안을 정하기 전에 재현하고 원인을 조사합니다. |
| 장기 작업이나 인계 | 필요할 때 진행 상태와 판단 근거를 기록합니다. |

계획, 워크트리, 리뷰 에이전트, 테스트 우선 구현은 계속 사용할 수 있습니다. 모든 작업에 연쇄적으로 적용하는 대신 실제 필요에 따라 선택합니다.

- 기존 승인을 재사용합니다. 스킬 자체는 브랜치 생성·커밋·푸시·병합·게시 권한을 부여하지 않습니다.
- 관련 맥락을 먼저 확인하고, 동작·범위·위험을 실질적으로 바꾸는 미결정 사항만 질문합니다.
- 변경 내용과 프로젝트 요구에 맞게 검증합니다. 코드가 바뀌지 않았다면 유효한 검증 결과를 재사용합니다.
- 리뷰 의견은 근거에 따라 바로 판단합니다. 재시도 횟수를 채워도 중요한 미해결 문제가 완료 상태가 되지는 않습니다.
- 유용한 회귀 테스트는 보존합니다. 임시 산출물 정리는 사용자·프로젝트 지침을 따르며, 공개 버전에는 새 테스트 파일을 일괄 삭제하는 규칙이 없습니다.

## 지원 범위와 준비 사항

수정된 절차는 주로 로컬 Codex에서 확인했습니다. 이 저장소는 스킬 모음이며 공식 Codex 플러그인이나 마켓플레이스 패키지가 아닙니다. 다른 에이전트 환경의 호환성은 검증하지 않았으며, 포함된 환경별 참조 문서도 호환성을 보장하지 않습니다.

설치에는 Python 3.8 이상이 필요하고, 아래 복제 명령에는 Git이 필요합니다. 선택적으로 사용하는 보조 도구는 Git, Bash, Node.js, Graphviz 등이 필요할 수 있습니다. 사용하는 기능에 필요한 도구만 준비하세요.

## 설치

저장소 내용과 기존 스킬을 확인한 뒤 실행하세요.

```bash
git clone https://github.com/qkrwoghd04/superpower-light.git
cd superpower-light
python3 scripts/install.py --dry-run
python3 scripts/install.py
```

기본 설치 위치는 `CODEX_HOME`이 설정되어 있으면 `$CODEX_HOME/skills`, 아니면 `~/.codex/skills`입니다. 상대 경로로 연결된 참조가 동작하도록 14개 스킬 폴더를 같은 상위 폴더에 나란히 복사하고, 각 설치 폴더에 `LICENSE`와 `NOTICE`도 보존합니다.

다른 상위 스킬 폴더를 지정하려면 다음과 같이 실행합니다.

```bash
python3 scripts/install.py --dest /path/to/skills --dry-run
python3 scripts/install.py --dest /path/to/skills
```

`--dry-run`은 파일을 설치하지 않고 작업 내용을 미리 보여줍니다. 설치 후 새 Codex 채팅을 시작하면 설치한 스킬을 불러올 수 있습니다.

### 기존 Superpowers가 설치되어 있는 경우

원본의 스킬 이름을 의도적으로 유지했습니다. 같은 이름의 원본과 이 수정본을 에이전트가 함께 발견하는 위치에 중복 설치하지 마세요.

설치 도구는 대상 위치에 같은 이름의 스킬 폴더가 있으면 덮어쓰지 않고 중단합니다. 기본 위치로 설치할 때는 알려진 `~/.codex/skills`, `~/.agents/skills` 위치의 이름 충돌도 확인합니다. 강제 덮어쓰기 옵션은 없습니다. 프로젝트별·플러그인별 탐색 위치는 별도로 확인해야 할 수 있으며, `--dest`를 지정해도 이름 중복 문제가 해결되는 것은 아닙니다.

소유자의 허락을 받은 뒤 충돌하는 사본을 **모든 스킬 탐색 경로 밖**에 백업하고, 미리보기를 다시 확인한 후 설치하세요. 탐색 경로 안에서 폴더 이름만 바꾸면 계속 발견될 수 있습니다. 기존 스킬을 자동으로 삭제하지 마세요.

업데이트도 같은 방식입니다. 변경 내용을 검토하고 기존 설치본을 허락받아 외부에 백업한 뒤 새 버전을 설치합니다. 되돌릴 때는 이번 설치본을 탐색 경로 밖으로 옮기고 자신의 백업을 복원하되, 설치 후 추가한 수정 사항도 보존하세요.

## 사용

`using-superpowers`는 Codex의 `agents/openai.yaml`에 `allow_implicit_invocation: false`가 설정되어 있어 명시적으로 호출합니다. 적절한 절차를 선택하는 진입점이며, 호출한다고 14개 스킬을 모두 실행하지는 않습니다.

```text
$using-superpowers 초대 링크 만료 기능에 맞는 작업 절차를 골라줘.
```

다른 스킬은 적용 조건을 좁힌 설명에 따라 일반적인 매칭을 유지합니다. 필요한 스킬을 직접 지정할 수도 있습니다.

```text
$systematic-debugging 이 테스트가 간헐적으로 실패하는 원인을 조사해줘.
```

별도의 전역 사용자 선호 파일은 필요하지 않습니다. 프로젝트 지침, 사용자의 명시적 요청, 실행 환경의 권한 제어는 계속 적용됩니다.

## 포함된 스킬

| 스킬 | 용도 |
| --- | --- |
| [using-superpowers](skills/using-superpowers/SKILL.md) | 명시적으로 요청한 작업 절차 선택. |
| [brainstorming](skills/brainstorming/SKILL.md) | 미정 요구사항과 영향이 큰 설계 선택 검토. |
| [writing-plans](skills/writing-plans/SKILL.md) | 복잡한 작업·재개·인계에 필요한 상세 계획. |
| [executing-plans](skills/executing-plans/SKILL.md) | 합의된 작업을 현재 세션에서 직접 실행. |
| [subagent-driven-development](skills/subagent-driven-development/SKILL.md) | 진행 속도나 검토 신뢰도에 도움이 되는 위임. |
| [dispatching-parallel-agents](skills/dispatching-parallel-agents/SKILL.md) | 담당 범위가 명확한 독립 작업의 병렬 처리. |
| [systematic-debugging](skills/systematic-debugging/SKILL.md) | 원인이 불명확한 실패 조사. |
| [test-driven-development](skills/test-driven-development/SKILL.md) | 적합한 로직 변경·버그 수정의 실패 우선 검증. |
| [requesting-code-review](skills/requesting-code-review/SKILL.md) | 요청되었거나 위험도에 따라 필요한 독립 리뷰. |
| [receiving-code-review](skills/receiving-code-review/SKILL.md) | 리뷰 의견을 근거에 따라 판단. |
| [verification-before-completion](skills/verification-before-completion/SKILL.md) | 실제 완료 주장에 필요한 검증 근거 확인. |
| [using-git-worktrees](skills/using-git-worktrees/SKILL.md) | 요청되었거나 이미 승인된 격리 환경 준비. |
| [finishing-a-development-branch](skills/finishing-a-development-branch/SKILL.md) | 승인된 통합과 소유권이 확인된 작업 공간 정리. |
| [writing-skills](skills/writing-skills/SKILL.md) | 재사용 가능한 에이전트 스킬 작성·관리. |

리뷰 보조 도구는 커밋 범위와 현재 작업 공간 스냅샷을 모두 지원합니다. 작업 공간 방식에는 스테이징·미스테이징 변경과 무시 규칙으로 제외되지 않은 관련 새 파일이 포함됩니다. 리뷰를 위해 커밋이나 새 계획 파일을 만들 필요는 없으며, 보조 도구 사용도 선택 사항입니다.

## 선택 사항: 시각적 브레인스토밍 도구

브레인스토밍에는 시각적 선택지를 보여주는 브라우저 도구가 포함되어 있습니다. 설치 과정이나 모든 브레인스토밍 작업에서 자동으로 시작하지 않습니다. 사용자가 그 사용을 승인한 뒤에만 실행합니다.

포함된 화면은 텍스트로 이름을 표시하며 원본 프로젝트의 로고 이미지를 요청하지 않습니다. Node.js 서버는 기본적으로 로컬 루프백 주소에 연결하며 HTTP·WebSocket 접근에 세션 키를 사용합니다. 실행 전 [사용 안내](skills/brainstorming/visual-companion.md)를 확인하고, 특히 접속 가능한 네트워크 범위를 변경할 때 주의하세요. 세션 URL과 키는 외부에 공유하지 마세요.

## 검증과 한계

개발 과정에서 필요한 행동 시나리오와 임시 Git·스크립트 검증 환경을 사용했습니다. 전체 개발 검증 도구는 재현 가능한 공개 테스트 모음으로 제공되지 않습니다. 이 검증이 모든 실행 환경의 호환성을 입증하거나 각 프로젝트의 필수 검사를 대신하지는 않습니다.

지침은 검토한 원본보다 짧아졌고 일률적인 절차 요구도 줄었습니다. 토큰·비용·속도·품질의 개선 수치를 보장하지 않습니다.

## 원작 표시와 라이선스

[obra/superpowers](https://github.com/obra/superpowers)를 바탕으로 이 저장소에서 독립적으로 수정·관리합니다. 원본 프로젝트의 공식 배포본이 아닙니다.

[MIT 라이선스](LICENSE)로 배포합니다. 원작 표시와 수정본의 범위는 [NOTICE](NOTICE)를 참고하세요.

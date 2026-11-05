# 🚀 [개발 온보딩] 로컬 개발 워크스테이션 구축 및 Docker 웹 서버 배포 보고서

## 1. 프로젝트 개요 (Project Overview)
- **과제명**: 개발 입문: 내 컴퓨터에 개발자용 '작업실' 꾸미기
- **제출자**: 박수경 (`baksuekyoung`)
- **저장소**: https://github.com/baksuekyoung/E1-1-
- **목표**:
  - 터미널, Docker, Git/GitHub 환경을 구축하여 재현 가능한 로컬 개발 워크스테이션 구성
  - `nginx:alpine` 기반 커스텀 Docker 이미지 빌드 및 포트 매핑 실행
  - Docker 볼륨을 이용한 컨테이너 데이터 영속성 검증
  - 트러블슈팅 경험 기록 및 문서화

---

## 2. 개발 및 실행 환경 (Environment)
- **OS**: Windows (WSL 2 기반 Linux Subsystem)
- **Shell Environment**: PowerShell / VSCode Terminal
- **Container Engine**: Docker Desktop (`nginx:alpine` 기반)
- **Version Control**: Git / GitHub

---

## 3. 미션 수행 요구사항 체크리스트 (Pass Criteria Verification)

### [기본 과제 (Core Tasks)]
- [x] **터미널 환경 구축 및 기본 조작**
  - 바탕화면 내 `codyssey_workspace` 작업 디렉토리 생성 및 관리
- [x] **Docker 데몬 및 가상화 점검**
  - Docker 엔진 정상 동작 및 기본 컨테이너(`ubuntu`) 실행 검증
- [x] **커스텀 Dockerfile 작성 및 이미지 빌드**
  - `nginx:alpine` 메인 베이스 이미지 활용
  - `LABEL` 및 `ENV` 메타데이터 지정
  - `COPY` 지시어로 `index.html` 컨테이너 내부 전송 설정
  - `my-web:1.0` 커스텀 이미지 빌드 완료 (`docker build -t my-web:1.0 .`)
- [x] **포트 매핑 및 웹 서버 서비스 검증**
  - `8080:80` 포트 바인딩 컨테이너 실행 (`docker run -d -p 8080:80 --name web-server-1 my-web:1.0`)
  - 웹 브라우저 접속 (`http://localhost:8080`)을 통한 `Hello Codyssey Docker!` 출력 정상 확인

### [보너스 과제 (Bonus Tasks)]
- [x] **Docker 볼륨 영속성 (Data Persistence) 검증**
  - 컨테이너 삭제 후에도 데이터가 유지되는지 영구 볼륨 연결 및 테스트 수행
- [x] **상세 트러블슈팅 기록**
  - 개발 과정에서 발생한 명령어 오류 및 터미널-브라우저 접속 개념 차이 해결 과정 명시

---

## 4. 미션 수행 세부 결과 (Execution Logs)

### (1) 작업 공간 구성 및 HTML 작성
- 바탕화면 내 전용 작업 디렉토리 생성 및 `index.html` 파일 작성:
  ```html
  <h1>Hello Codyssey Docker!</h1>
  ```

### (2) Dockerfile 작성
- 커스텀
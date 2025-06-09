<p align="center">
  <img src="https://github.com/user-attachments/assets/823da6bb-9faf-4484-ae33-e5a54abd04f7">
</p>

<h1 align="center">
  Planit
</h1>

## 투두(To-Do)
- 간단하고 직관적인 UI로 해야 할 과제를 효율적으로 관리 가능한 앱
### 시연 영상
https://github.com/user-attachments/assets/35872f1d-e268-4469-bb6b-64221fa1d643
## 팀원 소개
- 이학석(팀장) [<img src="https://img.shields.io/badge/Git-이학석-red?logo=GITHUb">](https://github.com/HSLee1013)
- 이강호 [<img src="https://img.shields.io/badge/Git-이강호-green?logo=GITHUb">](https://github.com/LeeKangHo1) 
- 임영록 [<img src="https://img.shields.io/badge/Git-임영록-blue?logo=GITHUb">](https://github.com/Young14482) 
- 구예은 [<img src="https://img.shields.io/badge/Git-구예은-orange?logo=GITHUb">](https://github.com/goho11)
## 백엔드 서버
<img src="https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white"><img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white"><img src="https://img.shields.io/badge/gradle-02303A?style=for-the-badge&logo=gradle&logoColor=white"><img src="https://img.shields.io/badge/H2-FF4000?style=for-the-badge&logo=H2&logoColor=white"><img src="https://img.shields.io/badge/intellijidea-000000?style=for-the-badge&logo=intellijidea&logoColor=white">
## 프론트엔드
<img src="https://img.shields.io/badge/flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"><img src="https://img.shields.io/badge/androidstudio-3DDC84?style=for-the-badge&logo=flask&logoColor=white">
### 협업
<img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white"><img src="https://img.shields.io/badge/slack-4A154B?style=for-the-badge&logo=slack&logoColor=white">
### 프로젝트 기간
- 2024년 12월 26일 ~ 2024년 1월 13일
## 목차
### 1. 프로젝트 설계([이동](#1-프로젝트-설계))
### 2. 주요 기능([이동](#2-주요-기능))
### 3. 백엔드 서버 깃허브([이동](https://github.com/Young14482/project-planit-api-server))
### 4. 담당 업무, 트러블 슈팅, 개인 소감
---
## 1. 프로젝트 설계
- ### 사이트맵
![사이트맵](https://github.com/user-attachments/assets/46058f63-3bf6-4c2c-8b1a-08b371c56b1c)
- ### ERD
![image](https://github.com/user-attachments/assets/55e8f9a4-5e1d-4159-8d11-b8281a2b63f4)
- ### API 문서
![image](https://github.com/user-attachments/assets/a5853b08-38da-40e0-8b22-edebedc8cfdf)

- ### 팀 노션 관리
![image](https://github.com/user-attachments/assets/60e8f949-a082-4dda-830c-e2a8ca4c00fa)

## 2. 주요 기능
### 유저 정보
- 로그인
- 아이디&비밀번호 찾기(변경)
- 회원가입
  ![image](https://github.com/user-attachments/assets/fd619107-61bc-477c-a6dc-ff10b496b8c5)

### 메인 화면
- 과제 모아보기
- 완료된 모든 과제 확인 및 삭제
- 캘린더 조회
- 작업 정렬 
![image](https://github.com/user-attachments/assets/38c3390e-27dc-4f78-ac57-4682a12a385a)

### 과제 추가
- 카테고리 선택
- 마감일 지정
- 반복 작업 설정
- 메모
  ![image](https://github.com/user-attachments/assets/4d510835-8899-4334-a572-d4b50a31a12b)

### 프로필
- 사용자 닉네임 상단에 표시
- 완료 & 미완료 작업 개수 
- 일일 작업 작업 완료 그래프
- 월별 완료된 작업 비율, 개수
![image](https://github.com/user-attachments/assets/cdb0fce6-c291-4422-a033-baaf528cb7d5)

### 사이드바
- 카테고리 보기
- 새 카테고리 생성
  
![image](https://github.com/user-attachments/assets/d399b139-6e39-43d1-aa44-f15f2e083477)

## 4. 담당 업무, 트러블 슈팅, 개인 소감
### 담당 업무
- 화면 설계
  ![화면설계 깃허브용2](https://github.com/user-attachments/assets/3c4869e2-7966-4992-a22e-8cd065449b1d)
- ERP 설계
- 백엔드 서버 구축
  - 깃허브 링크: [https://github.com/Young14482/project-planit-api-server](https://github.com/Young14482/project-planit-api-server)

### 트러블 슈팅
- #### 프론트 담당 팀원과 소통
	- 회원가입시 해당 정보가 DB에 저장되지 않는다는 프론트 담당 팀원의 문의가 들어옴.
	- 같이 작업하는 백엔드 서버 담당 팀원과 서버 검토 후 문제 없음.
	- 이후 api문서대로 하였는가에 대한 질문에 확인해 보겠다는 대답을 받음.
	- api호출 주소가 잘못된 것을 확인.
  - 프론트와의 협력 시 api문서의 중요성과 컨벤션에 대한 중요성등 소통의 중요성을 다시 한번 깨달음

### 개인 소감
- 당연히 서버측에서 구현해야하는 기능이라 생각해서 넣은 기능들이 프론트 담당 팀원들을 편하게 만들었을 때 기분이 좋았습니다.
백엔드가 고생할수록 프론트가 편해진다는 말을 들은적이 있었는데 이를 실감할 수 있었습니다.

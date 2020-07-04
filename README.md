# MONAMI 웹 포트폴리오 프로젝트

&nbsp;

&nbsp;

## 웹 사이트 구현기능(Front-end)

- ##### main page - 상단메뉴 클릭시 화면을 가득 채우는 메뉴 슬라이딩 효과

- ##### About page - 메인배너영역 슬라이드, 스크롤시 타이밍별 fade up, down, left 효과

&nbsp;

&nbsp;

## 웹 사이트 구현기능(Back-end)

- ##### 무한스크롤 AJAX

- ##### 장바구니 기능

- ##### 네이버, 카카오 로그인

- ##### 로그인, 회원가입, 회원정보수정

- ##### 네이버 지도 api 삽입

- ##### 관리자페이지 - 상품관리 (상품검색, 상품등록, 상품수정, 상품삭제)

- ##### 관리자페이지 - 회원관리 (회원검색, 회원권한변경)

- ##### 페이징 기능

&nbsp;

&nbsp;

## 초기 데이터 입력 

- ##### 상품 카테고리별 상품 및 상세페이지 웹 크롤링

&nbsp;

&nbsp;

## 프레젠테이션 링크

https://docs.google.com/presentation/d/1VjXvZXobMZod0hAQs_EvRePEGYiNmIRJ9iJMkHMtI-o/edit#slide=id.g8b173d8935_0_0

&nbsp;

&nbsp;

## 포트폴리오 영상 링크

https://www.youtube.com/watch?v=jTGl9vEyzMo&feature=youtu.be

&nbsp;

&nbsp;

## DataBase

##### 오라클 12C 사용자 생성

```sql
alter session set "_ORACLE_SCRIPT"=true;  
CREATE USER monami IDENTIFIED BY bitc5600;

GRANT CREATE SESSION TO monami;
GRANT CREATE TABLESPACE TO monami;
GRANT CREATE TABLE TO monami;
GRANT CREATE SEQUENCE TO monami;
alter user monami default tablespace users quota unlimited on users;
```

##### 테이블
```sql
CREATE TABLE users(
  	id number primary key,
    username varchar2(100) not null unique,
    password varchar2(100) not null,
  	phonenumber varchar2(20) not null,
    email varchar2(100) not null,
    address varchar2(100) not null,
    userProfile varchar2(200),
    userRole varchar2(20),
    createDate timestamp
) ;

CREATE TABLE items(
  	id number primary key,
    imgUrl varchar2(300),
    name varchar2(200),
    price varchar2(100),
    tag VARCHAR2(100),
    value VARCHAR2(100),
    BODYCOLOR VARCHAR2(4000),
    INKCOLOR VARCHAR2(4000),
    PRODUCTSPEC VARCHAR2(4000),
    CHARAC VARCHAR2(500),
    MAINCHARAC VARCHAR2(500),
    DETAILIMGURL VARCHAR2(300)
);

CREATE TABLE cart(
  id number primary key,
  userId number,
  itemId number,
  amount number
);

CREATE TABLE class(
  id number primary key,
  imgUrl VARCHAR2(4000),
  aLink VARCHAR2(4000)
);
```

##### 시퀀스
```sql
CREATE SEQUENCE USERS_SEQ
  START WITH 1
  INCREMENT BY 1;

CREATE SEQUENCE ITEMS_SEQ
  START WITH 1
  INCREMENT BY 1;

CREATE SEQUENCE CART_SEQ
  START WITH 1
  INCREMENT BY 1; 

CREATE SEQUENCE CLASS_SEQ
  START WITH 1
  INCREMENT BY 1; 
```


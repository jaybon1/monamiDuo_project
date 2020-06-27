#### MONAMI 웹 포트폴리오 프로젝트


## 오라클 12C 사용자 생성
```sql
alter session set "_ORACLE_SCRIPT"=true;  
CREATE USER monami IDENTIFIED BY bitc5600;

GRANT CREATE SESSION TO monami;
GRANT CREATE TABLESPACE TO monami;
GRANT CREATE TABLE TO monami;
GRANT CREATE SEQUENCE TO monami;
alter user monami default tablespace users quota unlimited on users;
```

## 테이블
```sql
CREATE TABLE users(
  	id number primary key,
    username varchar2(100) not null unique,
    password varchar2(100) not null,
  	phonenumber number not null,
    email varchar2(100) not null,
    address varchar2(100) not null,
    userProfile varchar2(200),
    userRole varchar2(20),
    createDate timestamp
) ;

CREATE TABLE board(
  	id number primary key,
    userId number,
    title varchar2(100) not null,
    content clob,
    readCount number default 0,
    createDate timestamp,
    foreign key (userId) references users (id)
);

CREATE TABLE reply(
  	id number primary key,
    userId number,
    boardId number,
    content varchar2(300) not null,
    createDate timestamp,
    foreign key (userId) references users (id) on delete set null,
    foreign key (boardId) references board (id) on delete cascade
);

CREATE TABLE items(
  	id number primary key,
    imgUrl varchar2(300),
    name varchar2(200),
    price varchar2(100),
    tag VARCHAR2(100),
    value VARCHAR2(100)
);
```

## 시퀀스
```sql
CREATE SEQUENCE USERS_SEQ
  START WITH 1
  INCREMENT BY 1;
  
CREATE SEQUENCE BOARD_SEQ
  START WITH 1
  INCREMENT BY 1;
  
CREATE SEQUENCE REPLY_SEQ
  START WITH 1
  INCREMENT BY 1;

CREATE SEQUENCE ITEMS_SEQ
  START WITH 1
  INCREMENT BY 1;
```


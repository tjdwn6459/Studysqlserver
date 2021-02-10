
USE sqlDB;
go

--create table testTbl (num int);
--drop table testTBL;


/*
use tempdb;
go
drop database tableDb;
go
create database tableDb;
*/

use tabledb;
go
drop table buyTbl;
drop table  userTbl;
go
create table userTbl --부모
(
userId     char(8)        not null    primary key,           --아이디
userName    nvarchar(10)  not null,                          --이름
birthYear   int           not null default year(getdate()),  --출생년도
addr        nchar(2)      not null default '서울',           --지역
mobile1     char(3)       null,                              --휴대폰 국번
mobile2     char(8)       null,                              --휴대폰 번호
height      smallint      null,                              --키
email       varchar(150)  not null     unique,               --이메일 추가 210210 14:25
mDate       date          null                               --회원가입일
);
go

create table buyTbl--자식
(
num          int          not null     identity(1,1),       --순번(pk)
userId       char(8)      not null
    foreign key references userTbl(userid),                  --아이디
prodName     nchar(6)     not null,                          --품명
groupName    nchar(4)     null,                              --분류                                               
price        int          not null,                          --단가
amount       smallint     not null                           --수량
);
go
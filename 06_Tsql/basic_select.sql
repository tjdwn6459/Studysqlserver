/*
select memberID, memberName 
 from membertbl
 where memberID like 'H';
 */
 
 --select '1';

--  use BikeStores;

--  select * from sales.customers;
 
--  select *  from production.products;

 --DB조회
 exec sp_helpdb;
 --테이블 조회
 exec sp_tables @table_type = "'table'";
 --열이름 조회
 exec sp_columns @table_name ='stocks',
         @table_owner ='production';
                 
  
INSERT into usertbl VALUES ('LSG', '이승기', 1987, '서울', '011','11111111', 182, '2008-8-8');
INSERT into usertbl VALUES ('KBS', '김범수', 1979, '경남', '011','22222222', 173, '2012-4-4');
INSERT into usertbl VALUES ('KKH', '김경호', 1971, '전남', '019','33333333', 177, '2007-7-7');
INSERT into usertbl VALUES ('JYP', '박진영', 1950, '경기', '011','44444444', 166, '2013-12-12');
INSERT into usertbl VALUES ('SSK', '성시경', 1979, '서울', NULL,NULL, 186, '2009-9-9');
INSERT into usertbl VALUES ('LJB', '임재범', 1963, '서울', '016','55555555', 182, '2005-5-5');
INSERT into usertbl VALUES ('YJS', '운종신', 1969, '경남', NULL,NULL, 170, '2014-3-3');
INSERT into usertbl VALUES ('EJW', '은지원', 1972, '경북', '011','66666666', 174, '2010-10-10');
INSERT into usertbl VALUES ('JKW', '조관우', 1965, '경기', '018','77777777', 172, '2013-5-5');
INSERT into usertbl VALUES ('BBK', '바비킴', 1973, '서울', '010','88888888', 176, '2009-4-4');
GO

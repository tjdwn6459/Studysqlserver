﻿use sqlDB;
go
--이름이 김경호인 사람 조회
select * from userTbl
where userName = '김경호';

--1970년 이후 출생이고 키 182 이상인 사람 아이디, 이름만 조회
select userID, userName
   from userTbl
   where birthYear >= 1970
     and height >= 182;
	 
-- 1970년 이후 출생이거나 키가 182이상이거나 인 사람들 모두
	 select userID, userName
   from userTbl
   where birthYear >= 1970
     or height >= 182;

-- 키가 180~183사이인 사람 조회
	 select userID, userName, height
   from userTbl
   where height >= 180
     and height <= 183;
	 
--between ~ and
	  select userID, userName, height
   from userTbl
   where height between 180 and 183;


   -- 지역이 경남, 전남, 경북
select userID, userName, height
   from userTbl
   where addr = '경남'
      or addr ='전남'
	  or addr = '경북';

-- 지역이 경남, 전남, 경북 을 다른식으로 표함
	  select userID, userName, height
   from userTbl
   where addr in('경남', '전남', '경북');

--  like
    select userID, userName, addr
   from userTbl
   where  userName like '김%';


   select userID, userName, addr
   from userTbl
   where  userName like  '_종신';

   --subquery
   select userName, height
    from userTbl
	where height > 177;


	--subquery를 말로 풀어서 실행 시킬 수 있는 경우

	select userName, height
    from userTbl
	where height > 
	(
	select height from userTbl where userName = '김경호'
	);


	--둘중 하나 경남이 주소인 사람들(any는or과 비슷하다)
	select userName, height
    from userTbl
	where height in
	(
	select height from userTbl where addr = '경남'
	); --170,173


--order by 정렬
select userName, mDate
  from userTbl
 order by mDate asc;--asc(오름차순), desc(내림차순)


 select *
  from userTbl
 order by mDate asc;

 --distinct(중복을 제외하고 결과를 볼때)
 select distinct addr
   from userTbl;


   --10명중 최신으로 가입한사람 5명만 보기

   select top(5) *
   from userTbl
   order by mDate desc;

-- offset  앞선 갯수만큼 뛰어넘은 후 조회
   select userID, userName, birthYear
   from userTbl
   order by birthYear
   
--복사
select * into buyTbl2 from buyTbl;
select userID, prodName into buyTbl3 from buyTbl;

--GROUP BY

select * from buyTbl; 

select userID, amount
from buyTbl
order by userID;

select userID, sum(amount) as '합계'
from buyTbl
group by userID

--min, max
select min(height) as '최소키'
  from userTbl;

  select max(height) as '최대키'
  from userTbl;

  --
  select userID,userName, min(height) as '최소키', max(height) as '최대키'
  from userTbl
  group by userID, userName;


  select userID, userName
  from userTbl
  where height = (select min(height) from userTbl)
     or height = (select max(height) from userTbl)

--총 데이터의 개수
select count(*) as '회원수' from userTbl; --10
select count(*) as '구매내역수' from buyTbl; --12


-- 잘못된 필터링
select userID, sum(price * amount) as '아이디별 구매금액'
from buyTbl
--where sum (price * amount) > 1000
group by userID
having sum(price * amount) > 1000
order by sum(price * amount);

--rollup / cube
select num, groupName, sum(price * amount) as ' 구매금액',
GROUPING_ID(groupName, num)

from buyTbl

group by rollup (groupName, num);


--userID, groupName 가지고 cube 다차원 합계
select userID me, sum(price * amount) as ' 구매금액',
GROUPING_ID(groupName, num)

from buyTbl

group by rollup (groupName, num);


--without CTE
select userID, sum(price * amount) as 'total'
 from buyTbl
 group by userID
 order by sum(price * amount) desc;


 --with CTE
 with cte_tmp(userID, total)
 as
 (
 select userID, sum(price * amount) as 'total'
 from buyTbl
 group by userID
 )
 select * from cte_tmp order by total DESC;








	 
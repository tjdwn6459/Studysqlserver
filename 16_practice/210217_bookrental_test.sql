--실제 회원정보 불러오기 레벨거꾸로,이름순
select memberID, memberName, levels, mobile, email 
from memberTbl
where levels <> 's'
order by levels desc, memberName ;


--책 정보
select cateidx, bookName, author, 
interpreter, company, price 
from booksTbl
order by price desc;

select * from CateTbl;

--시스템 함수사용 쿼리
select memberID,
concat(right(memberName, 2), ',', left(memberName,1)) as '미국식이름',
       dbo.ufn_getLevel(levels) as '회원레벨',
	   mobile,
      
	   upper(email) as '이메일'
 from  memberTbl
where levels <> 's'
order by levels , memberName ;

--사용자 레벨 리턴 함수(새 쿼리 열어서 실행)
create or alter function ufn_getLevel(@levels char(1))
returns nvarchar(5)
as
begin
     declare @result nvarchar(5);--골드회원, 실버회원, 브론즈회원, 철회원 등 변수
	 set @result = case @levels
	   when 'A' then '골드회원'
	   when 'B' then '실버회원'
	   when 'C' then '브론즈회원'
	   when 'D' then '철회원'
	   when 'S' then '관리자'
	   else '비회원'
	   end;
	   return @result;
end
go
--책 정보, 시스템 함수, 포맷 함수 쿼리
SELECT bookidx
      ,cateidx
      ,concat(N'책제목 > ',bookName) as bookName
      ,author
      ,isnull(interpreter, '(역자없음)') as '번역가 '
      ,company 
      ,format(releaseDate,'yyyy년 MM월 dd일' ) as '출판일' 
      ,format(price, '#,#.0원') as '가격 '
  FROM booksTbl

  --책 정보 조인 
  SELECT b.bookidx
      --b.cateidx
	  ,c.cateName
      ,b.bookName
      ,b.author
      ,b.interpreter
      ,b.company
  FROM dbo.booksTbl as b
  inner join CateTbl as c
  on b.cateidx = c.cateidx;

  --대여된 책의 정보 쿼리 조인
  SELECT r.rentalidx
      --,r.memberidx
	  ,m.memberName
     -- ,r.bookidx
	 ,b.bookName
	 ,b.author
      ,format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
      ,format(r.returnDt, 'yyyy-MM-dd') as '반납일'
      ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.rentalTbl as r
  inner join booksTbl as b
  on r.bookidx = b.bookidx
  inner join memberTbl as m
  on r.memberidx = m.memberidx;

  --책을 안빌린 회원 조회
  SELECT r.rentalidx
      --,r.memberidx
	  ,m.memberName
     -- ,r.bookidx
	 ,b.bookName
	 ,b.author
      ,format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
      ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.rentalTbl as r
  left outer join booksTbl as b
  on r.bookidx = b.bookidx
  right outer join memberTbl as m
  on r.memberidx = m.memberidx
  where r.rentalidx is null;

  --우리 책대여점에 없는 소설장르
SELECT c.cateidx
      ,c.cateName
	  ,b.bookName
  FROM CateTbl as c
  left outer join booksTbl as b 
  on c.cateidx = b.cateidx



create view uv_nonerentalMember --대여안한 멤버들 봄
as
SELECT r.rentalidx
     -- ,r.memberidx
	  ,m.memberName
      --,r.bookidx
	  ,b.cateidx
	  ,b.bookName
	  ,b.author
	  , format(r.rentalDt, 'yyyy-MM-dd') as rentalDt
	  , format(r.returnDt, 'yyyy-MM-dd') as returnDt
	  ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM rentalTbl as r
right outer join memberTbl as m
on r.memberidx = m.memberidx
left outer join booksTbl as b
on r.bookidx = b.bookidx
left outer join CateTbl as c 
on c.cateidx = b.cateidx
where r.rentalidx is null;
GO

--데이터 입력
insert into booksTbl
(
   cateidx,
   bookName,
   author,
   company,
   releaseDate,
   ISBN,
   price
   )

values
(
   'N0002',
   '순수하지 않은 감각',
   '요안나',
   '로코코',
   '2019.10.02',
   '9791135445705',
   11250
);


--책테이블 위 책 정보중, 설명, 등록일자 수정
begin tran;

select * from booksTbl

UPDATE booksTbl
     set descriptions = '부명그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석'
        ,regDate = '2021-02-18'
		where bookidx = 37

	rollback;
	commit;

--카테고리 입력(행 영향 받고 begin 하고 실행 하고 commit)

begin tran;

insert into CateTbl
/*(cateidx, cateName)*/
values ('I0001', '대화/협상'),
       ('I0002', '성공/처세'),
       ('I0003', '시간관리')

	   select * from CateTbl

	   rollback;
	   commit;

--카테 일부 삭제
delete from CateTbl where cateidx = 'I0003';


--두개 동시에 삭제
delete from CateTbl where cateidx in ('I0001','I0002')
	 

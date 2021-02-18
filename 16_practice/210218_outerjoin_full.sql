--outer join 쿼리
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

GO





--
select *
from stdTbl as s
left outer join clubreg_Tbl as r 
on s.id = r.std_id
full outer join clubTbl as c 
on r.club_id = c.id;

select *
from stdTbl as s 
left outer join clubTbl as c
on s.id = r.std_id;

select *
from clubreg_Tbl as r
right outer join clubTbl as c
on r.club_id = c.id;
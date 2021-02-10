

/*select * from stdTbl;
select * from clubTbl;
select * from clubregTbl;
*/


--standard  SQL
select s.id, s.stdName, c.clubName, c.buildingNum
from stdTbl as s
inner join clubreg_Tbl as r
on s.id = r.std_id
inner join clubTbl as c
on r.club_id = c.id;

--inner join 약식(내부조인)
select s.id, s.stdName, c.clubName, c.buildingNum
from stdTbl as s, clubregTbl as r, clubTbl as c
where s.id = r.std_id
and r.club_id = c.id;

--outer join(외부조인)
select s.id, s.stdName, c.clubName, c.buildingNum
from stdTbl as s
left outer join clubreg_Tbl as r
on s.id = r.std_id
left outer join clubTbl as c
on r.club_id = c.id;


--userTbl /buyTbl
select u.userName, u.addr,b.prodName, b.price
from userTbl as u
full outer join buyTbl as b
on u.userID = b.userID;

select * from buyTbl
select * from userTbl;
select * from buyTbl;

select * from userTbl where USERID ='JYP';
select * from buyTbl where USERID = 'JYP';


select * from buyTbl where USERID = 'BBK'

--INNER JOIN
select u.userName, u.addr,
       CONCAT (u.mobile1,'-', left (u.mobile2, 4),'-',right (u.mobile2, 4)) as mobile,
       b.prodName, b.price, b.amount
  from buyTbl as b
inner join userTbl as u
   on b.userID = u.userID
where b.userID ='JYP';
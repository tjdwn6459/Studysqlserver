use sqlDB;
go

create or alter procedure usp_buyproduct1
@userId char(8)
as
select NUM, userID, prodName, (PRICE * amount)AS '구매금액'
from buyTbl
where userId = @userId;
go

exec usp_buyproduct1'BBK';
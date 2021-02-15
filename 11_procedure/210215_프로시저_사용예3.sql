use sqlDB;
go

creaTE OR ALTER PRoc usp_return
@userName nvarchar(10)
as
declare @userId char(8);
select @userId = userId
from userTbl
where userName = @userName;

if (@userId<> '') return 1; --inline if
else return 0;
go

declare @retVal int ;
exec @retVal = usp_return '은자원';
print @retVal
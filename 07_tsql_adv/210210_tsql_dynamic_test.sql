declare @curDate date;
declare @curYear varchar(4), @curMonth varchar(2), @curDay varchar(2);
declare @sql varchar(2000);

set @curDate = getDate();
set @curYear = year(@curDate);
set @curMonth = month(@curDate);
set @curDay = day(@curDate);

print @curYear;
print replicate('0', 2 - len(@curMonth)) + @curMonth;--('a','b')a를 b번 반복한다
print right (('00' + @curMonth), 2);

print @curDay;

print format (@curDate, 'yyyy-MM-dd');--제일 쉬운 방법

set @sql = 'create table backup_' + format (@curDate, 'yyyy_MM_dd');
set @sql += '(id int not null primary key, bNam nvarchar(100) not null);';
print @sql;

exec(@sql);
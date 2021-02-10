declare @i smallint = 1 --1에서 100까지 증가할 변수
declare @hap bigint = 0;
set @i = 0;--더한 값을 누적할 변수 

while (@i <= 100)
begin
if(@i % 7 = 0)
begin
print concat('7의 배수, ', @i);
set @i +=1;
continue
end

set @hap += @i;
if(@hap > 1000) break;
set @i += 1;
end

print @hap;
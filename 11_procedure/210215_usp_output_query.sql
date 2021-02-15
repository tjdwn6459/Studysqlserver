create or alter  procedure usp_users4
 @txtValue nvarchar(20),
 @outValue int output --리턴받은 매개변수(파라미터)
as
 insert into testTbl values (@txtValue);
 select @outValue = IDENT_CURRENT('testTbl'); --testTbl의 현재 identity값 리턴
go

declare @myValue int;
exec usp_users4 '테스트값 2', @myValue output;

print concat ('현재 입력된 값은 ==> ', @myValue);
select @myValue;


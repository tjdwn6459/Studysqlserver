use sqlDB;
go

create or alter procedure usp_error
@userId char(8),
@userName nvarchar(10),
@birthYear int = 1900,
@addr nchar(2) = '서울',
@mobile1 char(3) = null,
@mobile2 char(8) = null,
@height smallint = 170,
@mdate date = '2021-02-15'
as

declare @err int;
BEGIN TRY
BEGIN TRAN
insert into userTbl values
(@userId, @userName, @birthYear,@addr, @mobile1, 
	@mobile2, @height, @mDate);
	COMMIT
END TRY
BEGIN CATCH
	select @err = ERROR_NUMBER();
ROLLBACK;
END CATCH

	if @err ! = 0
	begin
	print '###' + @userNAme + '을(를) insert에 실패했습니다.';
	end

	PRINT CONCAT ('에러번호 : ', @ERR);--오류번호 돌려줌
	go

	exec usp_error'WDT' , '우당탕', 1988, '부산','019', '99990925', 190, '2021-02-14';

    exec usp_error 'WDD', '우당당';

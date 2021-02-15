use sqlDB;
create table bankbook

( userName nvarchar(10),
userMoney int,
constraint ck_money
check (userMoney >=0)
);
go
insert into bankbook values (N'구매자', 1000);
insert into bankbook values (N'판매자', 0);

update bankbook set userMoney = userMoney - 500 where userName = N'구매자';
update bankbook set userMoney = userMoney + 500 where userName = N'판매자';

select * from bankbook;

begin tran
update bankbook set userMoney = userMoney - 500 where userName =N'구매자';
commit tran 

begin tran
update bankbook set userMoney = userMoney + 500 where userName =N'판매자';

commit tran

begin try
begin tran
update bankbook set userMoney = userMoney - 600 where userName = N'구매자';
update bankbook set userMoney = userMoney + 600 where userName = N'판매자';
commit tran
end try
begin catch
rollback tran
end catch

select * from bankbook;





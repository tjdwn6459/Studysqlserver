use sqlDB;
go

create OR ALTER trigger trg_testtbl
on testtbl
after INSERT, delete, update --삭제, 수정할때 트리거 발생
as
  print '새트리거 발생';

  insert into testTbl values ('BTS');
  select * from testTbl where txt = '마마무';
  update testTbl set txt = '마마무뉴!' where id = 4;
  delete testTbl where id = 3;
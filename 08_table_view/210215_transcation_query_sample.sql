USE [sqlDB]
GO
begin try

BEGIN TRAN;



INSERT INTO [dbo].[userTbl]
           ([userID]
           ,[userName]
           ,[birthYear]
           ,[addr]
           ,[mobile1]
           ,[mobile2]
           ,[height]
           ,[mDate])
     VALUES
           ('GJY'
		   ,'권지용'
           ,1988
           ,'한양'
           ,'010'
           ,'98989898'
		   ,'175'
           ,getdate()) ;

		   INSERT INTO [dbo].[buyTbl]
           ([userID]
           ,[prodName]
           ,[groupName]
           ,[price]
           ,[amount])
     VALUES
           ('GJY'
           ,'선글라스'
           ,NULL
           ,8000000
           ,1);


           

commit;

end try
begin CATCH
rollback 
END CATCH



GO
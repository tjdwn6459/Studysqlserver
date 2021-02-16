USE [sqlDB]
GO

UPDATE [dbo].[userTbl]
   SET [userName] = '관운장'
   where [userId] = 'JKW';
      GO

	  DELETE FROM userTbl
	  WHERE userID ='JKW';

go

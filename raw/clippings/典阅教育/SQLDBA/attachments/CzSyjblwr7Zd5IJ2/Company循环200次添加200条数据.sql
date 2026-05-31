USE [ZhaoxiEdu]
GO



declare @i int  
set @i=0
while @i<200
begin
    INSERT INTO [dbo].[Company]
           ([Name]
           ,[CreateTime]
           ,[CreatorId]
           ,[LastModifierId]
           ,[LastModifyTime])
     VALUES
           ('¹«Ë¾-'+convert(varchar(10),@i)
           ,getdate()
           ,@i
           ,@i
           ,getdate())
    set @i=@i +1
end



GO



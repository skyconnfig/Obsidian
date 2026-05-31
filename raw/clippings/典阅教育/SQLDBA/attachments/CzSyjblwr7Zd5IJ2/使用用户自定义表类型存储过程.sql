USE [ZhaoxiEdu]
GO

/****** Object:  StoredProcedure [dbo].[SP_CustomPager]    Script Date: 2022/8/23 10:21:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Alter PROCEDURE [dbo].[SP_CustomPagerForTableType] 
	@PageParameter PageParameter READONLY,
	@TotalRecord INT OUTPUT                    --返回总记录数
AS
BEGIN 
	--select * from  @PageParameter 
     --处理开始点和结束点
	 DECLARE  @TableName VARCHAR(50);            --表名
     DECLARE  @ReFieldsStr VARCHAR(200) = '*';   --字段名(全部字段为*)
     DECLARE  @OrderString VARCHAR(200);         --排序字段(必须!支持多字段不用加order by)
     DECLARE  @WhereString VARCHAR(500) =N'';  --条件语句(不用加where)
     DECLARE  @PageSize INT;                     --每页多少条记录
     DECLARE  @PageIndex INT = 1 ;               --指定当前为第几页
     --DECLARE  @TotalRecord INT OUTPUT;           --返回总记录数
	 select top 1 
	 @TableName=[TableName],
	 @ReFieldsStr=[ReFieldsStr],
	 @OrderString=[OrderString],
	 @WhereString=[WhereString],
	 @PageSize=[PageSize],
	 @PageIndex=[PageIndex]
	 from @PageParameter

    DECLARE @StartRecord INT;
    DECLARE @EndRecord INT; 
    DECLARE @TotalCountSql NVARCHAR(500); 
    DECLARE @SqlString NVARCHAR(2000);  
	
    SET @StartRecord = (@PageIndex-1)*@PageSize + 1--起始记录
    SET @EndRecord = @StartRecord + @PageSize - 1 --结尾记录
    SET @TotalCountSql= N'select @TotalRecord = count(*) from ' + @TableName;--总记录数语句
    SET @SqlString = N'(select row_number() over (order by '+ @OrderString +') as rowId,'+@ReFieldsStr+' from '+ @TableName;--查询语句

    IF (@WhereString! = '' or @WhereString!=null)
        BEGIN
            SET @TotalCountSql=@TotalCountSql + '  where '+ @WhereString;
            SET @SqlString =@SqlString+ '  where '+ @WhereString;            
        END

    --第一次执行得到
    EXEC sp_executesql @totalCountSql,N'@TotalRecord int out',@TotalRecord OUTPUT;--返回总记录数
    ----执行主语句
    SET @SqlString ='select * from ' + @SqlString + ') as t where rowId between ' + ltrim(str(@StartRecord)) + ' and ' +  ltrim(str(@EndRecord));
	Exec(@SqlString)    
END  
GO


---调用存储过程
DECLARE @PageParame PageParameter
DECLARE @TotalRecord INT
INSERT INTO @PageParame VALUES('Company','*','Id','',4,2,0)
--SELECT * FROM @PageParame 
EXEC SP_CustomPagerForTableType @PageParame,@TotalRecord output
select @TotalRecord



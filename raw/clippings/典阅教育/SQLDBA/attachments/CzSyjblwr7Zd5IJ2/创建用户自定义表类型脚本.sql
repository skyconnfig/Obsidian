USE [ZhaoxiEdu]
GO

/****** Object:  UserDefinedTableType [dbo].[PageParameter]    Script Date: 2022/8/23 11:18:20 ******/
CREATE TYPE [dbo].[PageParameter] AS TABLE(
	[TableName] [varchar](50) NOT NULL,
	[ReFieldsStr] [varchar](200) NOT NULL,
	[OrderString] [varchar](200) NOT NULL,
	[WhereString] [varchar](500) NOT NULL,
	[PageSize] [int] NOT NULL,
	[PageIndex] [int] NOT NULL,
	[TotalRecord] [int] NOT NULL
)
GO


---调用存储过程
DECLARE @PageParame PageParameter 
INSERT INTO @PageParame VALUES('Company','*','Id','',10,2,0)
SELECT * FROM @PageParame 
 
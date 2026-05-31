

--一、定义变量: 
declare @text varchar(20); --（变量名开始必须是@）

--二、赋值：
--方法1：
set @text = '你好'    --（不推荐） 
--方法2：
--select @text = 'hello'
 
--三、取值打印：
--输出内容
print @text	
--方法1：
select @text  --映射到结果集  
select '测试一下~'

--方法2：
print @text    --打印到消息框
print '测试一下~' 

--四、分支语句
declare @a int; 
declare @b int;

select @a=4; 
select @b=2;

if @a>@b  ---（不用写（）） 
  begin 
	print '@a的值大于@b的值'
  end 
else
  begin 
    print '@b的值大于@a的值'
  end

 ---begin  end 相当于{}


--五、循环语句——类似于C#中的循环，循环四要素：初始条件，循环条件，循环体，状态改变

declare @aa int ; 
select @aa=1;    --初始条件

while @aa<10 
begin 
	select @aa as 结果;      --循环体 
	print '结果为：'+ convert(varchar(10),@aa)
	select @aa=@aa+1; --状态改变
end


 

  
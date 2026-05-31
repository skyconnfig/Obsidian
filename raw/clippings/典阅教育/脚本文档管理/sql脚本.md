# sql脚本

<font style="color:rgb(77, 77, 77);">1. 替换字符  
使用函数REPLACE(s,s1,s2)，将字符串s中的 s1替换成s2，可以实现批量的列操作，同时可以保留原始数据，非常适合我遇到的场景。</font>

```sql
update 表 set 列 = replace(列, 待替换的字符串, 替换为的字符串) where 列 like '%待替换的字符串%';;
update table_name set column_name = replace(column_name, str_1 , str_2) where column_name like '%str_1%';
 update [SZGJJS20220715].[dbo].[dal_ComplexPlan] set Plan_Name=REPLACE(Plan_Name,'2022',' ')where Plan_Name like '% %'
```

<font style="color:rgb(77, 77, 77);">  
</font><font style="color:rgb(77, 77, 77);">2. 新增  
</font><font style="color:rgb(77, 77, 77);">新增的列默认是在表的最后，但是也可以使用 first、after关键字来声明具体位置。</font>

```sql
ALTER TABLE 语句用于在已有的表中添加、修改或删除列
1. 新增列默认是在表的最后
alter table 表名 add 列名 列属性;
alter table table_name add column_name tinyint unsigned not null default 100;
—— default 100(设置列的默认值)
```

<font style="color:rgb(77, 77, 77);">  
  
</font><font style="color:rgb(77, 77, 77);">2. 用first，声明新增的列在最前面  
</font>

```sql
alter table 表名 add 列名 列属性 first;
alter table table_name add column_name int primary key auto_increment first;
—— primary key auto_increment(设为主键，并自动增加)
```

<font style="color:rgb(77, 77, 77);">  
  
</font><font style="color:rgb(77, 77, 77);">3.用after，声明新增的列在哪个字段的后面  
</font>

```sql
alter table 表名 add 列名 列属性 after 另一个已存在的列名;
alter table table_name add column_name tinyint unsigned not null default 100 after other_exist_column_name;
```

<font style="color:rgb(77, 77, 77);">  
</font><font style="color:rgb(77, 77, 77);">3. 修改  
</font><font style="color:rgb(77, 77, 77);">change：既可以只修改列属性——列名和原来的相同但属性不同，也可以同时修改列名和属性——列名和和属性都不同；  
</font><font style="color:rgb(77, 77, 77);">modify：只能用于字段类型的修改  
</font>

```sql
1. change可以修改名称和属性
alter table 表名 change 被修改的列名 新的列名 新列的属性;
alter table table_name change column_name column_name smallint unsigned not null default 100;
alter table table_name change column_name other_column_name int unsigned not null default 110;
```

<font style="color:rgb(77, 77, 77);">  
  
</font><font style="color:rgb(77, 77, 77);">2. alter 只能用于修改字段类型  
</font>

```sql
alter table 表名 modify 列名 列类型;
alter table table_name modify column_name int;
```

<font style="color:rgb(77, 77, 77);">  
</font><font style="color:rgb(77, 77, 77);">4. 删除/清空  
</font>

```sql
使用update清空某一列数据时，注意该列的属性是不为null才可以，否则可以用''替代。
```

<font style="color:rgb(77, 77, 77);">1. 删除某列（机构上删除）  
</font>

```sql
alter table 表名 drop column 列名;
alter table table_name drop column column_name;
```

<font style="color:rgb(77, 77, 77);">  
  
</font><font style="color:rgb(77, 77, 77);">2.清空某列（删除改列所有数据）  
</font>

```sql
update 表名 set 列名 = '';
update table_name set column_name = null;
```



> 更新: 2022-08-17 09:13:48  
> 原文: <https://www.yuque.com/lixinsi/kmvnv0/zf8rq5>
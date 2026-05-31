# SymmetricDS 异构数据库同步软件部署案例

## [https://www.cnblogs.com/bobozhu/p/3694599.html](https://www.cnblogs.com/bobozhu/p/3694599.html)
<font style="color:rgb(0, 0, 0);">SymmetricDS是一个开源的同步软件，该软件是基于java环境编写的，在运行的时候需要安装JDK。SymmetricDS</font><font style="color:rgb(0, 0, 0);">可以同步文件和数据库，本文的重点是数据库方面的同步。</font>

<font style="color:rgb(0, 0, 0);">SymmetricDS支持多种数据库的同步，支持的数据库如下：</font>

<font style="color:rgb(0, 0, 0);">Oracle, MySQL, MariaDB, PostgreSQL, MS SQL Server (including Azure), IBM DB2, H2, HSQLDB, Derby, Firebird, Interbase, Informix, Greenplum, SQLite (including Android), Sybase ASE, and Sybase ASA (SQL Anywhere) databases.</font>

<font style="color:rgb(0, 0, 0);">数据库的同步可以按照计划同步，也可以实现准实时同步。</font>

<font style="color:rgb(0, 0, 0);">SymmetricDS是如何抓取源数据库的数据的变化然后再同步到目标数据库呢？</font>

<font style="color:rgb(0, 0, 0);">官方文档上介绍了三种方式来捕捉数据的变化：</font>

<font style="color:rgb(0, 0, 0);">• Lazy data capture queries changed data from a source system using some SQL condition (like a  
</font><font style="color:rgb(0, 0, 0);">time stamp column).</font>

<font style="color:rgb(0, 0, 0);">通过sql的查询来捕捉数据的变化，比如说通过时间戳的变化来捕捉变化的数据。  
</font><font style="color:rgb(0, 0, 0);">• Trigger-based data capture installs database triggers to capture changes.</font>

<font style="color:rgb(0, 0, 0);">通过在数据库中建立触发器来捕捉每张表的数据的变化。（在部署SymmetricDS的时候，所选中的需要同步的表，会由SymmetricDS自动建立触发器来捕捉该表中数据的更新，插入以及删除。）  
</font><font style="color:rgb(0, 0, 0);">• Log-based data capture reads data changes from proprietary database recovery logs.</font>

<font style="color:rgb(0, 0, 0);">基于日志的数据变化。通过读取数据库中日志的变化来捕捉变化的数据。</font>

<font style="color:rgb(0, 0, 0);">所有以上三个方面都有自己的优势和缺点，并且以上三种捕捉数据变化的方式，SymmetricDS在将来都会实现。但在目前，SymmetricDS只支持前两种方式来捕捉数据的变化。</font>

<font style="color:rgb(0, 0, 0);">下面通过一个官方的一个demo来实现sql server 到 Mysql的同步功能，该Demo是corp和store之间的同步，即公司和商店之间的数据库的同步。</font>

**<font style="color:rgb(0, 0, 0);background-color:rgb(0, 204, 255);">一  安装并配置SymmetricDS  </font>**<font style="color:rgb(0, 0, 0);background-color:rgb(0, 204, 255);">   </font><font style="color:rgb(0, 0, 0);background-color:rgb(0, 204, 255);">                                                                                                                                                                   </font>

<font style="color:rgb(0, 0, 0);">1.首先，从http://www.symmetricds.org/ 下载symmetric-ds-3.x.x-server.zip 文件。</font>

<font style="color:rgb(0, 0, 0);">2.在本地建立两个文件夹以此来代表两台机器。一个文件夹安装corp的SymmetricDS软件，另一个文件夹下也安装SymmetricDS软件代表store。</font>

![1663470353156-878bb941-3041-47ea-ad95-42320402a713.png](./img/T-KdyTxzO35c5i9s/1663470353156-878bb941-3041-47ea-ad95-42320402a713-716499.png)

<font style="color:rgb(0, 0, 0);">然后拷贝下载的symmetric-ds-3.x.x-server.zip文件分别到这两个文件夹下，并解压缩到当前文件夹到这两个文件夹下。</font>

<font style="color:rgb(0, 0, 0);">3.拷贝配置文件到相应路径下。</font>

<font style="color:rgb(0, 0, 0);">从F:\sync\sym-corp\samples路径下拷贝corp-000.properties到F:\sync\sym-corp\engines下，同样在F:\sync\sym-store001\samples下拷贝store-001.properties到F:\sync\sym-store001\engines下。</font>

<font style="color:rgb(0, 0, 0);">4.修改配置文件使SymmetricDS连接到数据库。</font>

<font style="color:rgb(0, 0, 0);">Corp的配置：</font>

<font style="color:rgb(0, 0, 0);">打开F:\sync\sym-corp\engines下的corp-000.properties，可以看到里面都是数据库连接的配置。</font>

<font style="color:rgb(0, 0, 0);">第22行 ：engine.name=corp-000，这个是该engine的名字。</font>

<font style="color:rgb(0, 0, 0);">我这个demo中，公司的数据库是sql server，那么在这个文件中的配置应该如下：</font>

![1663470353086-de58ddca-2d79-4aaf-82e7-16f80b75d973.gif](./img/T-KdyTxzO35c5i9s/1663470353086-de58ddca-2d79-4aaf-82e7-16f80b75d973-191184.gif)

<font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);"> 1</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">#数据库驱动的类名 </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);"> 2</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">  </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);"> 3</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> 　　　　　　db.driver=</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">net.sourceforge.jtds.jdbc.Driver </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);"> 4</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">  </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);"> 5</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">　　　　　　#jdbc连接 </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);"> 6</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">  </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);"> 7</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> 　　　　　　db.url=jdbc:jtds:sqlserver:</font><font style="color:rgb(0, 128, 0);background-color:rgb(245, 245, 245);">//</font><font style="color:rgb(0, 128, 0);background-color:rgb(245, 245, 245);">localhost:1433/corp000;useCursors=true;bufferMaxMemory=10240;lobBuffer=5242880</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);"> 8</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">  </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);"> 9</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">　　　　　　#数据库的登陆账号 </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">10</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">  </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">11</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> 　　　　　　db.user=</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">sa </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">12</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">  </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">13</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">　　　　　　#数据库的登陆密码 </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">14</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">  </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">15</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> 　　　　　　db.password=</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">Administrator </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">16</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">  </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">17</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">　　　　　　#主节点的注册地址 </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">18</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> 　　　　　　registration.url= </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">19</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> 　　　　　　sync.url=http:</font><font style="color:rgb(0, 128, 0);background-color:rgb(245, 245, 245);">//</font><font style="color:rgb(0, 128, 0);background-color:rgb(245, 245, 245);">localhost:8050/sync/corp-000</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">20</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">  </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">21</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">　　　　　　#设置的group id </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">22</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">  </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">23</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> 　　　　　　group.id=</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">corp </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">24</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">  </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">25</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">　　　　　　#分配的一个ID </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">26</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> 　　　　　　external.id=000</font>

![1663470353107-c4805c44-ad23-435e-bbf3-3c636a2df83e.gif](./img/T-KdyTxzO35c5i9s/1663470353107-c4805c44-ad23-435e-bbf3-3c636a2df83e-285494.gif)

<font style="color:rgb(0, 0, 0);">store的配置：</font>

<font style="color:rgb(0, 0, 0);">打开F:\sync\sym-store001\engines下的store-001.properties，可以看到里面都是数据库连接的配置。</font>

<font style="color:rgb(0, 0, 0);">第22行 ：engine.name=store-001，这个是该engine的名字。</font>

<font style="color:rgb(0, 0, 0);">我这个demo中，公司的数据库是sql server，那么在这个文件中的配置应该如下：</font>

![1663470353102-9b17bb2f-f5ae-4aa2-9725-04464ce478eb.gif](./img/T-KdyTxzO35c5i9s/1663470353102-9b17bb2f-f5ae-4aa2-9725-04464ce478eb-095580.gif)

<font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);"> 1</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">　#数据库驱动的类名 </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);"> 2</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">  </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);"> 3</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> 　　　　　　db.driver=</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">com.mysql.jdbc.Driver </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);"> 4</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">　　　　　　#jdbc连接 </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);"> 5</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">  </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);"> 6</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> 　　　　　　db.url=jdbc:mysql:</font><font style="color:rgb(0, 128, 0);background-color:rgb(245, 245, 245);">//</font><font style="color:rgb(0, 128, 0);background-color:rgb(245, 245, 245);">localhost/store001</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);"> 7</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">　　　　　　#数据库的登陆账号 </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);"> 8</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">  </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);"> 9</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> 　　　　　　db.user=</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">root </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">10</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">　　　　　　#数据库的登陆密码 </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">11</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">  </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">12</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> 　　　　　　db.password=</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">root </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">13</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">　　　　　　#需要连接主节点的SymmetrcDS来注册，只有注册通过之后，才能同步 </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">14</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> 　　　　　　registration.url=http:</font><font style="color:rgb(0, 128, 0);background-color:rgb(245, 245, 245);">//</font><font style="color:rgb(0, 128, 0);background-color:rgb(245, 245, 245);">localhost:8050/sync/corp-000</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">15</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">　　　　　　#设置的group id </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">16</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">  </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">17</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> 　　　　　　group.id=</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">store </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">18</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">  </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">19</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">　　　　　　#分配的一个ID </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">20</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> 　　　　　　external.id=001</font>

![1663470353095-56594857-6003-444c-8281-aba80fd64792.gif](./img/T-KdyTxzO35c5i9s/1663470353095-56594857-6003-444c-8281-aba80fd64792-296151.gif)

**<font style="color:rgb(0, 0, 0);background-color:rgb(0, 204, 255);">二  建立数据库并创建相应的业务表和系统表</font>****<font style="color:rgb(0, 0, 0);background-color:rgb(0, 204, 255);">           </font>****<font style="color:rgb(0, 0, 0);background-color:rgb(0, 204, 255);">                                                                                                                                       </font>**

<font style="color:rgb(0, 0, 0);background-color:rgb(0, 128, 0);">△ 配置corp000的数据库信息</font>

<font style="color:rgb(0, 0, 0);">1.打开命令窗口并定位到F:\sync\sym-corp\bin路径下</font>

![1663470353439-4fd543d6-e70e-4c3f-afdc-42f790a48307.png](./img/T-KdyTxzO35c5i9s/1663470353439-4fd543d6-e70e-4c3f-afdc-42f790a48307-989795.png)

<font style="color:rgb(0, 0, 0);">2.建立业务表</font>

<font style="color:rgb(0, 0, 0);">在cmd窗口中输入以下命令，并按回车：</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">dbimport --engine corp-000 --format XML F:\sync\sym-corp\samples\create_sample.xml</font>

<font style="color:rgb(0, 0, 0);"></font>

![1663470353657-db59c21a-3614-4e4a-863c-90a3ab6083c8.png](./img/T-KdyTxzO35c5i9s/1663470353657-db59c21a-3614-4e4a-863c-90a3ab6083c8-122820.png)

<font style="color:rgb(0, 0, 0);">以上命令代表运行bin路径下的 dbimport.bat并调用engine路径下的corp-000.properties配置文件，并执行F:\sync\sym-corp\samples路径下的create_sample.xml脚本，在执行之后会在sql server的corp数据库中创建四张以下表:</font>

<font style="color:rgb(0, 0, 0);">item,item_selling_price,sale_return_line_item,sale_transaction</font>

<font style="color:rgb(0, 0, 0);">3.在corp数据库中创建SymmetricDS的系统表</font>

<font style="color:rgb(0, 0, 0);">因SymmetricDS的运行需要一些系统表来装载数据同步的相关信息，因此需要创建一些SymmetricDS需要的系统表。</font>

<font style="color:rgb(0, 0, 0);">在cmd窗口中继续输入以下命令，并按回车：</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">symadmin --engine corp-000 create-sym-tables</font>

<font style="color:rgb(0, 0, 0);">在执行以上命令之后会在sql server的corp数据库中创建多张以sym_ 开头的SymmetricDS的系统表。</font>

<font style="color:rgb(0, 0, 0);">4.最后，需要在业务表中插入一些数据以做同步测试用。</font>

<font style="color:rgb(0, 0, 0);">继续在cmd命令窗口中运行以下命令：</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">dbimport --engine corp-000 F:\sync\sym-corp\samples\insert_sample.sql</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(0, 128, 0);">△ 配置store001的数据库信息</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(0, 128, 0);">1.另外打开一个cmd窗口(上面那个cmd窗口先开着，后边会用到，就不需要重新打开了)，定位到F:\sync\sym-store001\bin路径下。</font><font style="color:rgb(0, 0, 0);background-color:rgb(0, 128, 0);">  
</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(0, 128, 0);">2.在cmd窗口中运行以下命令以创建与corp一样的业务表</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">dbimport --engine store-001 --format XML F:\sync\sym-store001\samples\create_sample.xml</font>

<font style="color:rgb(0, 0, 0);"></font>

<font style="color:rgb(0, 0, 0);">以上corp和store的相关表的配置已经完成，请确认corp和store的数据库的以下相关信息:</font>

<font style="color:rgb(0, 0, 0);">1.从corp数据库向store数据库同步的以下两张表是否在两个数据库中都存在：</font>

<font style="color:rgb(0, 0, 0);">item , item_selling_price</font>

<font style="color:rgb(0, 0, 0);">2.从store向corp数据库同步的以下两张表是否在两个数据库中都存在:</font>

<font style="color:rgb(0, 0, 0);">sale_transaction , sale_return_line_item</font>

<font style="color:rgb(0, 0, 0);">3.在corp数据库中，是否存在以sym_开头的系统表，比如sym_channel,sym_trigger, sym_router, 和 sym_trigger_router表。</font>

<font style="color:rgb(0, 0, 0);">4.确认corp数据库中的item表中有测试数据。</font>

<font style="color:rgb(0, 0, 0);"></font>

**<font style="color:rgb(0, 0, 0);background-color:rgb(0, 204, 255);">三 启动SymmetricDS并同步数据                                                                                                                                      </font>**

<font style="color:rgb(0, 0, 0);">1.上一步骤中，我们打开了两个cmd的窗口，分别将路径定位到F:\sync\sym-corp\bin和F:\sync\sym-store001\bin，如果关闭的话，请重新打开两个cmd命令窗口，并将路径定位到corp和store的bin文件夹路径下，以代表corp机器和store机器。</font><font style="color:rgb(0, 0, 0);">  
</font>

<font style="color:rgb(0, 0, 0);">2.在corp的cmd窗口中，运行以下命令：</font>

<font style="color:rgb(0, 0, 0);"></font>

<font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">sym --engine corp-000 --port 8050</font>

<font style="color:rgb(0, 0, 0);"></font>

<font style="color:rgb(0, 0, 0);">以上命令在第一次运行的时候，将会对相应的需要同步的表在数据库中建立触发器，可以查看数据库中的该表的触发器。如下图所示，建立了三个触发器来捕捉该表的数据的删除，插入和更新操作。</font>

![1663470353824-2852ae49-85d8-45bf-80d8-eaeee52840fe.png](./img/T-KdyTxzO35c5i9s/1663470353824-2852ae49-85d8-45bf-80d8-eaeee52840fe-417734.png)

<font style="color:rgb(0, 0, 0);"></font>

<font style="color:rgb(0, 0, 0);">之后，SymmetricDS</font><font style="color:rgb(0, 0, 0);">将会监听8050端口，来监听同步的请求和向corp发来注册请求的信息。</font>

<font style="color:rgb(0, 0, 0);">3</font><font style="color:rgb(0, 0, 0);">.在store的cmd窗口中，运行以下命令:</font>

<font style="color:rgb(0, 0, 0);"></font>

<font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">sym --engine store-001 --port 8010</font>

<font style="color:rgb(0, 0, 0);"></font>

<font style="color:rgb(0, 0, 0);">在store机器上第一次运行以上命令时，将会自动创建SymmetricDS的系统表，然后会根据F:\sync\sym-store001\engines下的store-001.properties中的registration.url来取得主机的注册地址（即corp的注册地址），并一直向该url发送注册请求。</font>

<font style="color:rgb(0, 0, 0);"></font>

**<font style="color:rgb(0, 0, 0);background-color:rgb(0, 204, 255);">四 注册节点</font>****<font style="color:rgb(0, 0, 0);background-color:rgb(0, 204, 255);">                                                                                                                                                                                                          </font>**

<font style="color:rgb(0, 0, 0);">当一个没有注册的节点启动后，它将会尝试根据engines文件下的*.properties中的registration.url向该url发送注册信息，只有注册之后才能够同步数据。但是root节点(这儿是corp节点)的注册功能并没有打开，所以需要打开root节点的注册功能才可以接收注册请求。</font>

<font style="color:rgb(0, 0, 0);">1.在上一步骤中，我们打开了两个cmd窗口分别代表corp节点和store节点，上一步中，现在store节点每隔一定时间就尝试向corp节点发送注册信息，因为corp的注册功能并没有打开，所以store节点的注册请求一直失败，请看下图中的最后一行:RegistrationService - Could not register.  Sleeping for 28000 ms before attempting again.</font>

![1663470353752-186fc2f2-8e89-48aa-b3a4-7953215c26bf.png](./img/T-KdyTxzO35c5i9s/1663470353752-186fc2f2-8e89-48aa-b3a4-7953215c26bf-523786.png)

<font style="color:rgb(0, 0, 0);">现在打开第三个cmd命令窗口，并定位到F:\sync\sym-corp\bin，然后运行以下命令：</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">symadmin --engine corp-000 open-registration store 001</font>

<font style="color:rgb(0, 0, 0);">以上命令是运行bin文件下的sysadmin命令，并调用engine文件下的corp-000配置文件，对group node为store，编号为001的节点打开注册窗口。</font>

<font style="color:rgb(0, 0, 0);">然后查看store节点的cmd窗口的输出，发现注册成功。</font>

<font style="color:rgb(0, 0, 0);"></font>

**<font style="color:rgb(0, 0, 0);background-color:rgb(0, 204, 255);">五 初始化数据                                                                                                                                                                     </font>**

<font style="color:rgb(0, 0, 0);">1.打开一个cmd窗口，定位到corp的F:\sync\sym-corp\bin 路径下，运行以下命令：</font>

<font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">symadmin --engine corp-000 reload-node 001</font>

<font style="color:rgb(0, 0, 0);">以上命令就是将数据从corp节点上初始化到 编号为001的节点上，初始化之后，可以在store节点上的数据库中的item和item_selling_price表中查找到数据。</font>

<font style="color:rgb(0, 0, 0);">2.在corp节点pull data到store节点</font>

<font style="color:rgb(0, 0, 0);">打开sql server的corp库，并运行以下sql:</font>

<font style="color:rgb(0, 0, 255);background-color:rgb(245, 245, 245);">1　　insert</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 255);background-color:rgb(245, 245, 245);">into</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> item (item_id, name) </font><font style="color:rgb(0, 0, 255);background-color:rgb(245, 245, 245);">values</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> (</font>**<font style="color:rgb(128, 0, 0);background-color:rgb(245, 245, 245);">110000055</font>**<font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">, </font><font style="color:rgb(255, 0, 0);background-color:rgb(245, 245, 245);">'</font><font style="color:rgb(255, 0, 0);background-color:rgb(245, 245, 245);">Soft Drink</font><font style="color:rgb(255, 0, 0);background-color:rgb(245, 245, 245);">'</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">); </font><font style="color:rgb(0, 0, 255);background-color:rgb(245, 245, 245);">2　　insert</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 255);background-color:rgb(245, 245, 245);">into</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> item_selling_price (item_id, store_id, price)  </font><font style="color:rgb(0, 0, 255);background-color:rgb(245, 245, 245);">3　　values</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> (</font>**<font style="color:rgb(128, 0, 0);background-color:rgb(245, 245, 245);">110000055</font>**<font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">, </font><font style="color:rgb(255, 0, 0);background-color:rgb(245, 245, 245);">'</font><font style="color:rgb(255, 0, 0);background-color:rgb(245, 245, 245);">001</font><font style="color:rgb(255, 0, 0);background-color:rgb(245, 245, 245);">'</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">,</font>**<font style="color:rgb(128, 0, 0);background-color:rgb(245, 245, 245);">0.65</font>**<font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">);  </font><font style="color:rgb(0, 0, 255);background-color:rgb(245, 245, 245);">4　　insert</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 255);background-color:rgb(245, 245, 245);">into</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> item_selling_price (item_id, store_id, price)  </font><font style="color:rgb(0, 0, 255);background-color:rgb(245, 245, 245);">5　　values</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> (</font>**<font style="color:rgb(128, 0, 0);background-color:rgb(245, 245, 245);">110000055</font>**<font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">,</font><font style="color:rgb(255, 0, 0);background-color:rgb(245, 245, 245);">'</font><font style="color:rgb(255, 0, 0);background-color:rgb(245, 245, 245);">002</font><font style="color:rgb(255, 0, 0);background-color:rgb(245, 245, 245);">'</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">, </font>**<font style="color:rgb(128, 0, 0);background-color:rgb(245, 245, 245);">1.00</font>**<font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">);</font>

<font style="color:rgb(0, 0, 0);">运行完毕之后，可以查看mysql上的store库的item和item_selling_price表，数据已经同步过去了。</font>

<font style="color:rgb(0, 0, 0);">在以上sql的第4行和第5行，是一条insert语句，因为其插入的是002节点，而store是配置的001节点，所以这条数据并未插入到mysql的store数据库中，而corp节点并未找到002节点，因此该条数据被丢弃。</font>

<font style="color:rgb(0, 0, 0);">从corp节点往store节点是用pull的方式同步数据的，即corp节点有新的数据插入后，并不主动同步到store节点，而是等待store节点来取数据。</font>

<font style="color:rgb(0, 0, 0);">3.store节点push data到corp</font>

<font style="color:rgb(0, 0, 0);">在mysql的store库中，打开一个查询窗口，运行以下代码:</font>

<font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">1</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 255);background-color:rgb(245, 245, 245);">insert</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 255);background-color:rgb(245, 245, 245);">into</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> sale_transaction (tran_id, store_id, workstation, </font><font style="color:rgb(255, 0, 255);background-color:rgb(245, 245, 245);">day</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">, seq) </font><font style="color:rgb(0, 0, 255);background-color:rgb(245, 245, 245);">values</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">2</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> (</font>**<font style="color:rgb(128, 0, 0);background-color:rgb(245, 245, 245);">1000</font>**<font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">, </font><font style="color:rgb(255, 0, 0);background-color:rgb(245, 245, 245);">'</font><font style="color:rgb(255, 0, 0);background-color:rgb(245, 245, 245);">001</font><font style="color:rgb(255, 0, 0);background-color:rgb(245, 245, 245);">'</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">, </font><font style="color:rgb(255, 0, 0);background-color:rgb(245, 245, 245);">'</font><font style="color:rgb(255, 0, 0);background-color:rgb(245, 245, 245);">3</font><font style="color:rgb(255, 0, 0);background-color:rgb(245, 245, 245);">'</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">, </font><font style="color:rgb(255, 0, 0);background-color:rgb(245, 245, 245);">'</font><font style="color:rgb(255, 0, 0);background-color:rgb(245, 245, 245);">2007-11-01</font><font style="color:rgb(255, 0, 0);background-color:rgb(245, 245, 245);">'</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">, </font>**<font style="color:rgb(128, 0, 0);background-color:rgb(245, 245, 245);">100</font>**<font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">); </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">3</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 255);background-color:rgb(245, 245, 245);">insert</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 0, 255);background-color:rgb(245, 245, 245);">into</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> sale_return_line_item (tran_id, item_id, price, quantity) </font><font style="color:rgb(0, 0, 255);background-color:rgb(245, 245, 245);">values</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> </font><font style="color:rgb(0, 128, 128);background-color:rgb(245, 245, 245);">4</font><font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);"> (</font>**<font style="color:rgb(128, 0, 0);background-color:rgb(245, 245, 245);">1000</font>**<font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">, </font>**<font style="color:rgb(128, 0, 0);background-color:rgb(245, 245, 245);">110000055</font>**<font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">, </font>**<font style="color:rgb(128, 0, 0);background-color:rgb(245, 245, 245);">0.65</font>**<font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">, </font>**<font style="color:rgb(128, 0, 0);background-color:rgb(245, 245, 245);">1</font>**<font style="color:rgb(0, 0, 0);background-color:rgb(245, 245, 245);">);</font>

<font style="color:rgb(0, 0, 0);">数据将会同步到corp节点。当store数据库中的表插入新的数据时，数据将会主动push到corp节点。</font>



> 更新: 2022-09-18 11:06:19  
> 原文: <https://www.yuque.com/lixinsi/mxdptw/zyesc6>
# Redhat Linux破解root密码

<font style="color:rgb(0, 0, 0);">Linux破解root密码是RHCSA中的第一道题，只有破解密码才能继续之后的操作。（后期会整理出RHCSA和RHCE的相关题目）而在平时，我们是用Linux虚拟机的时候，如果一不小心忘记了root密码，那就GG了，几乎是什么事都做不了。作为一个Linux玩家，这种事是绝对不允许的！那就来看看Linux怎么破解root密码的吧！</font>

# <font style="color:rgb(0, 0, 0);">破解环境</font>
+ <font style="color:rgb(0, 0, 0);">RHEL7.4（7的版本都差不多，之前的版本可能会有差异）</font>

# <font style="color:rgb(0, 0, 0);">开始破解</font>
1. <font style="color:rgb(0, 0, 0);">开启虚拟机，进入引导界面迅速按</font><font style="color:rgb(232, 62, 140);background-color:rgb(246, 246, 246);">⬆⬇</font><font style="color:rgb(0, 0, 0);">j键，然后选择</font>**<font style="color:rgb(0, 0, 0);">Red Hat Enterprise Linux Server (3.10.0-693.e17.x86_64) 7.4 (Mapio)</font>**<font style="color:rgb(0, 0, 0);">,按</font><font style="color:rgb(232, 62, 140);background-color:rgb(246, 246, 246);">E</font><font style="color:rgb(0, 0, 0);">进入编辑模式</font>

![1655691836706-3582a227-e7ae-430d-85cf-2c024273eb57.png](./img/ts2LY4GQn7o3ZRQM/1655691836706-3582a227-e7ae-430d-85cf-2c024273eb57-307559.png)

1. <font style="color:rgb(0, 0, 0);">使用</font><font style="color:rgb(232, 62, 140);background-color:rgb(246, 246, 246);">⬇</font><font style="color:rgb(0, 0, 0);">向下直到看到</font>**<font style="color:rgb(0, 0, 0);">initrd16</font>**<font style="color:rgb(0, 0, 0);">,然后在它的上一行末尾加上</font><font style="color:rgb(232, 62, 140);background-color:rgb(246, 246, 246);">rd.break</font><font style="color:rgb(0, 0, 0);">，然后</font><font style="color:rgb(232, 62, 140);background-color:rgb(246, 246, 246);">Ctrl+X</font><font style="color:rgb(0, 0, 0);">使系统继续运行。</font>

![1655691836704-5ce9cc8a-6d81-4b93-bb32-378016e5bb92.png](./img/ts2LY4GQn7o3ZRQM/1655691836704-5ce9cc8a-6d81-4b93-bb32-378016e5bb92-908992.png)<font style="color:rgb(0, 0, 0);">  
</font>![1655691836671-17d61f4a-7721-48e5-b769-b872dfb5d9cd.png](./img/ts2LY4GQn7o3ZRQM/1655691836671-17d61f4a-7721-48e5-b769-b872dfb5d9cd-810434.png)

1. <font style="color:rgb(0, 0, 0);">然后会进入紧急救援模式，使用</font><font style="color:rgb(232, 62, 140);background-color:rgb(246, 246, 246);">mount -o remount,rw /sysroot</font><font style="color:rgb(0, 0, 0);">重新以读写的方式挂载</font><font style="color:rgb(0, 0, 0);">系统。重新挂载之后，切换到单用户模式。</font>

![1655691836702-931691ee-37ba-4cc0-b074-ef84128c7bdc.png](./img/ts2LY4GQn7o3ZRQM/1655691836702-931691ee-37ba-4cc0-b074-ef84128c7bdc-249062.png)

1. <font style="color:rgb(0, 0, 0);">注意看前面的提示符，进入单用户模式之后，就可以修改密码了。可以使用</font><font style="color:rgb(232, 62, 140);background-color:rgb(246, 246, 246);">passwd</font><font style="color:rgb(0, 0, 0);">来修改(会要求输入两遍密码)。一般我们直接就使用</font><font style="color:rgb(232, 62, 140);background-color:rgb(246, 246, 246);">echo "密码" | passwd --stdin root</font><font style="color:rgb(0, 0, 0);">来修改密码（一遍过，不会提示要输入第二遍确认）。</font>

<font style="color:rgb(85, 85, 85);">这里修改密码，不会看到提示密码修改成功，只会看到很多的小方块，如果害怕没有修改成功，想看到提示，修改一下语言的变量就可以了。  
</font><font style="color:rgb(85, 85, 85);">使用</font><font style="color:rgb(232, 62, 140);background-color:rgb(246, 246, 246);">LANG=en</font><font style="color:rgb(85, 85, 85);">修改语言为英语，然后修改成功后就可以看到提示了。</font>

1. <font style="color:rgb(0, 0, 0);">然后就是创建</font><font style="color:rgb(232, 62, 140);background-color:rgb(246, 246, 246);">.autorelabel</font><font style="color:rgb(0, 0, 0);">文件，这是</font>**<font style="color:rgb(0, 0, 0);">必须要创建</font>**<font style="color:rgb(0, 0, 0);">的，如果不创建或是创建错误，那么就会密码破解失败。创建完成后可以直接重启</font><font style="color:rgb(232, 62, 140);background-color:rgb(246, 246, 246);">reboot</font><font style="color:rgb(0, 0, 0);">，也可以</font><font style="color:rgb(232, 62, 140);background-color:rgb(246, 246, 246);">exit</font><font style="color:rgb(0, 0, 0);">退出单用户，再</font><font style="color:rgb(232, 62, 140);background-color:rgb(246, 246, 246);">exit</font><font style="color:rgb(0, 0, 0);">退出紧急救援模式。然后系统就会重启或是继续运行。</font>

![1655691836725-0ad8e808-008a-431d-a424-5cba4f40a72f.png](./img/ts2LY4GQn7o3ZRQM/1655691836725-0ad8e808-008a-431d-a424-5cba4f40a72f-359358.png)

![1655691837885-17910709-fb23-4360-9a9b-01a97ee42a7c.png](./img/ts2LY4GQn7o3ZRQM/1655691837885-17910709-fb23-4360-9a9b-01a97ee42a7c-462276.png)

以上内容均属原创，转载请注明出处。 

1. <font style="color:rgb(0, 0, 0);">等系统重新启动后，直接使用设置的root密码就可以登录系统了。</font>

# <font style="color:rgb(34, 34, 38);">linux下nmon的安装及使用</font>
查看redhat版本

cat /etc/redhat-release 



<font style="color:rgb(77, 77, 77);">nmon 是一款系统监控程序，可以用来对CPU、磁盘、内存等资源指标来做实时监控。</font>

<font style="color:rgb(77, 77, 77);">1.下载nmon压缩包：</font>

<font style="color:rgb(77, 77, 77);">http://nmon.sourceforge.net/pmwiki.php?n=Site.Download</font>

<font style="color:rgb(77, 77, 77);">根据系统的发型版本及CPU位数选择相应的压缩包下载，如系统发行版本为：7.4</font>

<font style="color:rgb(77, 77, 77);">[root@node1</font><font style="color:rgb(77, 77, 77);"> </font><font style="color:rgb(77, 77, 77);">~]# cat /etc/redhat-release</font>

<font style="color:rgb(77, 77, 77);">Red Hat Enterprise Linux Server release 7.4 (Maipo)</font>

<font style="color:rgb(77, 77, 77);">[root@node1</font><font style="color:rgb(77, 77, 77);"> </font><font style="color:rgb(77, 77, 77);">~]# uname -a</font>

<font style="color:rgb(77, 77, 77);">Linux node1 3.10.0-693.el7.x86_64 #1 SMP Thu Jul 6 19:56:57 EDT 2017 x86_64 x86_64 x86_64 GNU/Linux</font>

<font style="color:rgb(77, 77, 77);"></font>

![1659831463177-f7c28abf-5f13-4f43-aeac-3a4ae87a53f8.png](./img/ts2LY4GQn7o3ZRQM/1659831463177-f7c28abf-5f13-4f43-aeac-3a4ae87a53f8-596186.png)

<font style="color:rgb(77, 77, 77);">2.下载到系统中</font>

<font style="color:rgb(77, 77, 77);">[root@node1</font><font style="color:rgb(77, 77, 77);"> </font><font style="color:rgb(77, 77, 77);">highgo]# ll nmon16g_x86.tar.gz</font>

<font style="color:rgb(77, 77, 77);">-rw-------. 1 highgo highgo 692079 Feb 12 11:04 nmon16g_x86.tar.gz</font>

<font style="color:rgb(77, 77, 77);">3.解压</font>

<font style="color:rgb(77, 77, 77);">[root@node1</font><font style="color:rgb(77, 77, 77);"> </font><font style="color:rgb(77, 77, 77);">highgo]# tar -xvf nmon16g_x86.tar.gz</font>

<font style="color:rgb(77, 77, 77);">nmon16g_x86_fedora25</font>

<font style="color:rgb(77, 77, 77);">nmon16g_x86_rhel72</font>

<font style="color:rgb(77, 77, 77);">nmon16g_x86_sles114</font>

<font style="color:rgb(77, 77, 77);">nmon16g_x86_sles12</font>

<font style="color:rgb(77, 77, 77);">nmon16g_x86_ubuntu1604</font>

<font style="color:rgb(77, 77, 77);">4.将nmon16g_x86_rhel72复制到环境变量的路径下</font>

<font style="color:rgb(77, 77, 77);">[root@node1</font><font style="color:rgb(77, 77, 77);"> </font><font style="color:rgb(77, 77, 77);">bin]# mkdir /usr/local/bin/nmon</font>

<font style="color:rgb(77, 77, 77);">[root@node1</font><font style="color:rgb(77, 77, 77);"> </font><font style="color:rgb(77, 77, 77);">nmon]# cp nmon16g_x86_rhel72 /usr/local/bin/nmon/</font>

<font style="color:rgb(77, 77, 77);">[root@node1</font><font style="color:rgb(77, 77, 77);"> </font><font style="color:rgb(77, 77, 77);">nmon]# ll</font>

<font style="color:rgb(77, 77, 77);">total 400</font>

<font style="color:rgb(77, 77, 77);">-rwxrwxrwx. 1 root root 406334 Feb 12 11:12 nmon16g_x86_rhel72</font>

<font style="color:rgb(77, 77, 77);">cd /usr/local/bin/nmon</font>

<font style="color:rgb(77, 77, 77);">chmod +777  nmon16g_x86_rhel72</font>

<font style="color:rgb(77, 77, 77);">4.启动nmon</font>

<font style="color:rgb(77, 77, 77);">[root@node1</font><font style="color:rgb(77, 77, 77);"> </font><font style="color:rgb(77, 77, 77);">nmon]# ./nmon16g_x86_rhel72</font>

<font style="color:rgb(77, 77, 77);"></font>

![1659831463471-dfcd1869-32e5-4856-ad8e-f3a67e2cf7d4.png](./img/ts2LY4GQn7o3ZRQM/1659831463471-dfcd1869-32e5-4856-ad8e-f3a67e2cf7d4-939044.png)

<font style="color:rgb(77, 77, 77);">5.采集系统性能信息，并生成报告</font>

<font style="color:rgb(77, 77, 77);">执行./nmon -s3 -c60 -f -m ./report，-s3为每3s收集一次性能信息，-c60为收集60次，-f为生成的文件名包含该文件创建时间，-m ./report为指定测试报告存储路径</font>

<font style="color:rgb(77, 77, 77);">[root@node1</font><font style="color:rgb(77, 77, 77);"> </font><font style="color:rgb(77, 77, 77);">nmon]# ./nmon16g_x86_rhel72 -s3 -c60 -f -m /opt/report</font>

<font style="color:rgb(77, 77, 77);">[root@node1</font><font style="color:rgb(77, 77, 77);"> </font><font style="color:rgb(77, 77, 77);">nmon]# cd /opt/report/</font>

<font style="color:rgb(77, 77, 77);">[root@node1</font><font style="color:rgb(77, 77, 77);"> </font><font style="color:rgb(77, 77, 77);">report]# ll</font>

<font style="color:rgb(77, 77, 77);">total 36</font>

<font style="color:rgb(77, 77, 77);">-rw-r--r--. 1 root root 33733 Feb 12 11:33 node1_200212_1133.nmon</font>

<font style="color:rgb(51, 51, 51);">如每隔</font><font style="color:rgb(51, 51, 51);">5</font><font style="color:rgb(51, 51, 51);">秒采集一次，一共采集</font><font style="color:rgb(51, 51, 51);">12</font><font style="color:rgb(51, 51, 51);">次，就是</font><font style="color:rgb(51, 51, 51);">1</font><font style="color:rgb(51, 51, 51);">分钟的数据（生成的文件已标红）：</font>

<font style="color:black;background-color:#F5F5F5;">[qgc@localhost nmon16d]$ nmon -f -s</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:purple;background-color:#F5F5F5;">5</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:black;background-color:#F5F5F5;">-c</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:purple;background-color:#F5F5F5;">12</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:black;background-color:#F5F5F5;">-m /home/qgc/Desktop/</font>

<font style="color:black;background-color:#F5F5F5;">[qgc@localhost nmon16d]$ nmon -f -T -s </font><font style="color:purple;background-color:#F5F5F5;">5</font><font style="color:black;background-color:#F5F5F5;"> -c </font><font style="color:purple;background-color:#F5F5F5;">12</font><font style="color:black;background-color:#F5F5F5;"> -m /home/qgc/Desktop/</font>

<font style="color:rgb(51, 51, 51);">数据采集完毕后，如需关闭</font><font style="color:rgb(51, 51, 51);">nmon</font><font style="color:rgb(51, 51, 51);">进程，需要获取</font><font style="color:rgb(51, 51, 51);">nmon</font><font style="color:rgb(51, 51, 51);">的</font><font style="color:rgb(51, 51, 51);">pid</font><font style="color:rgb(51, 51, 51);">（已标红）</font>

<font style="color:black;background-color:#F5F5F5;">[qgc@localhost Desktop]$</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:blue;background-color:#F5F5F5;">ps</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:black;background-color:#F5F5F5;">-ef |</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:blue;background-color:#F5F5F5;">grep</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:black;background-color:#F5F5F5;">nmon</font>

<font style="color:black;background-color:#F5F5F5;">qgc       </font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:purple;background-color:#F5F5F5;">4455</font><font style="color:red;background-color:#F5F5F5;">（</font><font style="color:red;background-color:#F5F5F5;">pid</font><font style="color:red;background-color:#F5F5F5;">）</font><font style="color:black;background-color:#F5F5F5;">  </font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:purple;background-color:#F5F5F5;">4349</font><font style="color:red;background-color:#F5F5F5;">（</font><font style="color:red;background-color:#F5F5F5;">ppid</font><font style="color:red;background-color:#F5F5F5;">）</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:purple;background-color:#F5F5F5;">0</font><font style="color:rgb(37, 43, 58);background-color:#F5F5F5;"> </font><font style="color:purple;background-color:#F5F5F5;">23</font><font style="color:black;background-color:#F5F5F5;">:</font><font style="color:purple;background-color:#F5F5F5;">40</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:black;background-color:#F5F5F5;">pts/</font><font style="color:purple;background-color:#F5F5F5;">0</font><font style="color:black;background-color:#F5F5F5;">   </font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:purple;background-color:#F5F5F5;">00</font><font style="color:black;background-color:#F5F5F5;">:</font><font style="color:purple;background-color:#F5F5F5;">00</font><font style="color:black;background-color:#F5F5F5;">:</font><font style="color:purple;background-color:#F5F5F5;">00</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:black;background-color:#F5F5F5;">nmon</font>

<font style="color:black;background-color:#F5F5F5;">qgc       </font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:purple;background-color:#F5F5F5;">4491</font><font style="color:black;background-color:#F5F5F5;">  </font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:purple;background-color:#F5F5F5;">4429</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:purple;background-color:#F5F5F5;">0</font><font style="color:rgb(37, 43, 58);background-color:#F5F5F5;"> </font><font style="color:purple;background-color:#F5F5F5;">23</font><font style="color:black;background-color:#F5F5F5;">:</font><font style="color:purple;background-color:#F5F5F5;">40</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:black;background-color:#F5F5F5;">pts/</font><font style="color:purple;background-color:#F5F5F5;">1</font><font style="color:black;background-color:#F5F5F5;">   </font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:purple;background-color:#F5F5F5;">00</font><font style="color:black;background-color:#F5F5F5;">:</font><font style="color:purple;background-color:#F5F5F5;">00</font><font style="color:black;background-color:#F5F5F5;">:</font><font style="color:purple;background-color:#F5F5F5;">00</font><font style="color:rgb(37, 43, 58);background-color:#F5F5F5;"> </font><font style="color:blue;background-color:#F5F5F5;">grep</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:black;background-color:#F5F5F5;">nmon</font>

<font style="color:rgb(51, 51, 51);">再安全杀掉该进程：</font><font style="color:rgb(51, 51, 51);">kill -9 pid</font>

<font style="color:black;background-color:#F5F5F5;">[qgc@localhost Desktop]$</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:blue;background-color:#F5F5F5;">kill</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:black;background-color:#F5F5F5;">-</font><font style="color:purple;background-color:#F5F5F5;">9</font><font style="color:rgb(37, 43, 58);background-color:#F5F5F5;"> </font><font style="color:purple;background-color:#F5F5F5;">4455</font>

<font style="color:black;background-color:#F5F5F5;">[qgc@localhost Desktop]$</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:blue;background-color:#F5F5F5;">ps</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:black;background-color:#F5F5F5;">-ef |</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:blue;background-color:#F5F5F5;">grep</font><font style="color:black;background-color:#F5F5F5;"> </font><font style="color:black;background-color:#F5F5F5;">nmon</font>

<font style="color:black;background-color:#F5F5F5;">qgc        </font><font style="color:purple;background-color:#F5F5F5;">4493</font><font style="color:black;background-color:#F5F5F5;">   </font><font style="color:purple;background-color:#F5F5F5;">4429</font><font style="color:black;background-color:#F5F5F5;">  </font><font style="color:purple;background-color:#F5F5F5;">0</font><font style="color:rgb(37, 43, 58);background-color:#F5F5F5;"> </font><font style="color:purple;background-color:#F5F5F5;">23</font><font style="color:black;background-color:#F5F5F5;">:</font><font style="color:purple;background-color:#F5F5F5;">40</font><font style="color:black;background-color:#F5F5F5;"> pts/</font><font style="color:purple;background-color:#F5F5F5;">1</font><font style="color:black;background-color:#F5F5F5;">    </font><font style="color:purple;background-color:#F5F5F5;">00</font><font style="color:black;background-color:#F5F5F5;">:</font><font style="color:purple;background-color:#F5F5F5;">00</font><font style="color:black;background-color:#F5F5F5;">:</font><font style="color:purple;background-color:#F5F5F5;">00</font><font style="color:rgb(37, 43, 58);background-color:#F5F5F5;"> </font><font style="color:blue;background-color:#F5F5F5;">grep</font><font style="color:black;background-color:#F5F5F5;"> nmon</font>

**<font style="color:rgb(51, 51, 51);">六，数据分析</font>**

**<font style="color:rgb(51, 51, 51);">1</font>****<font style="color:rgb(51, 51, 51);">，下载</font>****<font style="color:rgb(51, 51, 51);">nmon analyser</font>**

<font style="color:rgb(51, 51, 51);">借助</font><font style="color:rgb(51, 51, 51);">nmon analyser</font><font style="color:rgb(51, 51, 51);">可以把</font><font style="color:rgb(51, 51, 51);">nmon</font><font style="color:rgb(51, 51, 51);">采集的数据生成直观的</font><font style="color:rgb(51, 51, 51);">Excel</font><font style="color:rgb(51, 51, 51);">表，</font><font style="color:rgb(51, 51, 51);">nmon analyser</font><font style="color:rgb(51, 51, 51);">可以在</font><font style="color:rgb(51, 51, 51);">IBM</font><font style="color:rgb(51, 51, 51);">的官网下载，</font>[https://www.ibm.com/developerworks/community/wikis/home?lang=en#!/wiki/Power+Systems/page/nmon_analyser](https://bbs.huaweicloud.com/forum/thread-23199-1-1.html#)

<font style="color:rgb(37, 43, 58);"></font>

<font style="color:rgb(51, 51, 51);">在</font><font style="color:rgb(51, 51, 51);">windows</font><font style="color:rgb(51, 51, 51);">上下载后解压，有</font><font style="color:rgb(51, 51, 51);">word</font><font style="color:rgb(51, 51, 51);">和</font><font style="color:rgb(51, 51, 51);">exce</font><font style="color:rgb(51, 51, 51);">两个文档，</font><font style="color:rgb(51, 51, 51);">Word</font><font style="color:rgb(51, 51, 51);">是说明文档，包括更新日志，详细参数等，其中的</font><font style="color:rgb(51, 51, 51);">Excel</font><font style="color:rgb(51, 51, 51);">就是</font><font style="color:rgb(51, 51, 51);">nmon analyser</font><font style="color:rgb(51, 51, 51);">工具了。</font>

**<font style="color:rgb(51, 51, 51);">2</font>****<font style="color:rgb(51, 51, 51);">，打开</font>****<font style="color:rgb(51, 51, 51);">nmon analyser</font>**

<font style="color:rgb(51, 51, 51);">双击打开nmon analyser v54.xlsm，点击Analyze nmon data按钮：</font><font style="color:rgb(37, 43, 58);">  
</font>

**<font style="color:rgb(51, 51, 51);"></font>****<font style="color:rgb(51, 51, 51);">注：</font>**<font style="color:rgb(51, 51, 51);">因为我用的个人免费版</font><font style="color:rgb(51, 51, 51);">WPS</font><font style="color:rgb(51, 51, 51);">（</font><font style="color:rgb(51, 51, 51);">10.1</font><font style="color:rgb(51, 51, 51);">），没有包含宏，需要安装宏插件</font><font style="color:rgb(51, 51, 51);">(VBA for WPS)</font><font style="color:rgb(51, 51, 51);">，</font><font style="color:rgb(51, 51, 51);">Excel</font><font style="color:rgb(51, 51, 51);">是自带宏插件的，如果宏不能运行，需要做以下操作：</font><font style="color:rgb(51, 51, 51);">  
</font><font style="color:rgb(51, 51, 51);">工具</font><font style="color:rgb(51, 51, 51);"> </font><font style="color:rgb(51, 51, 51);">-></font><font style="color:rgb(51, 51, 51);"> </font><font style="color:rgb(51, 51, 51);">宏</font><font style="color:rgb(51, 51, 51);"> </font><font style="color:rgb(51, 51, 51);">-></font><font style="color:rgb(51, 51, 51);"> </font><font style="color:rgb(51, 51, 51);">安全性</font><font style="color:rgb(51, 51, 51);"> </font><font style="color:rgb(51, 51, 51);">-></font><font style="color:rgb(51, 51, 51);"> </font><font style="color:rgb(51, 51, 51);">中，然后再打开文件并允许运行宏。</font>

**<font style="color:rgb(51, 51, 51);">3</font>****<font style="color:rgb(51, 51, 51);">，下载</font>****<font style="color:rgb(51, 51, 51);">VBA for WPS</font>**

<font style="color:rgb(51, 51, 51);">地址：</font>[https://pan.baidu.com/s/1QzW4ebQxYQtxgVfkTmxVJw](https://pan.baidu.com/s/1QzW4ebQxYQtxgVfkTmxVJw)<font style="color:rgb(51, 51, 51);">，下载</font><font style="color:rgb(51, 51, 51);">VBA7.0.1590_For WPS(</font><font style="color:rgb(51, 51, 51);">中文</font><font style="color:rgb(51, 51, 51);">).exe</font><font style="color:rgb(51, 51, 51);">后，先退出</font><font style="color:rgb(51, 51, 51);">WPS</font><font style="color:rgb(51, 51, 51);">，再直接安装就行，再次打开</font><font style="color:rgb(51, 51, 51);">nmon analyser</font><font style="color:rgb(51, 51, 51);">，启用宏</font>

<font style="color:rgb(37, 43, 58);"></font>

**<font style="color:rgb(51, 51, 51);">4</font>****<font style="color:rgb(51, 51, 51);">，使用</font>****<font style="color:rgb(51, 51, 51);">nmon analyser</font>****<font style="color:rgb(51, 51, 51);">生成图表</font>**

<font style="color:rgb(51, 51, 51);">成功打开</font><font style="color:rgb(51, 51, 51);">nmon analyser</font><font style="color:rgb(51, 51, 51);">后，点击</font><font style="color:rgb(51, 51, 51);">Analyze nmon data</font><font style="color:rgb(51, 51, 51);">按钮，选择</font><font style="color:rgb(51, 51, 51);">nmon</font><font style="color:rgb(51, 51, 51);">数据文件，会再次提示另存为，选择地址保存即可。</font><font style="color:rgb(51, 51, 51);"> </font>

<font style="color:rgb(37, 43, 58);">  
</font>

# <font style="color:rgb(0, 0, 0);">Nmon实时监控并生成HTML监控报</font>
<font style="color:rgb(51, 51, 51);">之前的文章介绍了服务端监控工具：Nmon使用方法，最近在github找到了一个nmon自动监控并生成HTML格式报告的工具：</font>**<font style="color:rgb(51, 51, 51);">easyNmon</font>**<font style="color:rgb(51, 51, 51);">，使用体验蛮不错的，这里介绍下它的安装及使用方法。</font>

**<font style="color:rgb(51, 51, 51);">一、关于easyNmon说明</font>**

<font style="color:rgb(51, 51, 51);">说明：为了方便多场景批量监控，作者用golang写了个监控程序，可以通过web页面启动和停止nmon服务， 适配Loadrunner和jmeter进行性能测试，可以做到批量执行场景并生成监控报告！</font>

<font style="color:rgb(51, 51, 51);">环境适配：该执行文件默认为CentOS（6.5-7.4）版本，Ubuntu和SUSE需要下载对应版本的nmon替换！</font>

**<font style="color:rgb(51, 51, 51);">二、下载安装</font>**

**<font style="color:rgb(51, 51, 51);">1、文件下载</font>**

<font style="color:rgb(51, 51, 51);">通过github下载该执行文件，然后上传到</font>[服务器](https://cloud.tencent.com/product/cvm?from=10680)<font style="color:rgb(51, 51, 51);">，使用 tar -zxvf easyNmon.tar.gz 命令解压，如下图：</font>

![1659833131533-ea5cb519-bec0-43ed-8ba3-97e816c39275.png](./img/ts2LY4GQn7o3ZRQM/1659833131533-ea5cb519-bec0-43ed-8ba3-97e816c39275-890430.png)

<font style="color:rgb(51, 51, 51);">解压后会生成一个easyNmon文件夹，进入该文件夹，通过命令 ./monitor& 启动easyNmon服务（后缀加&为后台运行）。</font>

**<font style="color:rgb(51, 51, 51);">2、常用信息查看</font>**

<font style="color:rgb(51, 51, 51);">在easyNmon目录下，输入 ./monitor -h 查看相关信息，如下图：</font>

![1659833131549-4f9ef8b4-676c-4af0-89f6-6ca8f8a796cb.png](./img/ts2LY4GQn7o3ZRQM/1659833131549-4f9ef8b4-676c-4af0-89f6-6ca8f8a796cb-538301.png)

**<font style="color:rgb(51, 51, 51);">3、web页面</font>**

<font style="color:rgb(51, 51, 51);">可以通过帮助信息里面的信息，访问web页面查看该工具的页面管理功能，如下图：</font>

![1659833131409-9c1865d4-dd2f-46ec-9ee9-2ca1498b9606.png](./img/ts2LY4GQn7o3ZRQM/1659833131409-9c1865d4-dd2f-46ec-9ee9-2ca1498b9606-943896.png)

<font style="color:rgb(51, 51, 51);">PS：如果是</font>[云服务器](https://cloud.tencent.com/product/cvm?from=10680)<font style="color:rgb(51, 51, 51);">，需要在云服务器控制台开启对应的安全组规则，否则无法访问！！！（上图是我的阿里云私有IP，访问的web地址需要换成公有IP地址）</font>

**<font style="color:rgb(51, 51, 51);">4、修改端口</font>**

<font style="color:rgb(51, 51, 51);">默认端口为9999，如果需要修改访问web页面的地址端口，需要自行修改，命令为 ./monitor -p 端口号 ，修改后查看帮助信息，如下图：</font>

![1659833131404-4ccfba15-92c0-4370-8a2d-7df68dbcf170.png](./img/ts2LY4GQn7o3ZRQM/1659833131404-4ccfba15-92c0-4370-8a2d-7df68dbcf170-694246.png)

**<font style="color:rgb(51, 51, 51);">三、监控服务使用</font>**

**<font style="color:rgb(51, 51, 51);">1、集成jmeter启动</font>**

<font style="color:rgb(51, 51, 51);">安装好之后，在jmeter中添加线程组，然后按照如下格式填写对应的信息，添加仅一次控制器（因为后台服务启动后，只需要启动一次监控服务即可）</font>

![1659833131505-948d725e-1112-446a-8d0b-f41038a56ace.png](./img/ts2LY4GQn7o3ZRQM/1659833131505-948d725e-1112-446a-8d0b-f41038a56ace-940691.png)

**<font style="color:rgb(51, 51, 51);">2、web页面启动</font>**

![1659833132281-8a1f2e64-dbff-43cc-93cc-634cd859e66b.png](./img/ts2LY4GQn7o3ZRQM/1659833132281-8a1f2e64-dbff-43cc-93cc-634cd859e66b-864454.png)

<font style="color:rgb(51, 51, 51);">接下来，就是启动压测脚本，进行压测并查看服务器监控报告。</font>

**<font style="color:rgb(51, 51, 51);">四、HTML格式监控报告</font>**

**<font style="color:rgb(51, 51, 51);">PS</font>**<font style="color:rgb(51, 51, 51);">：压测脚本结束后，默认生成监控报告，手动停止测试脚本，也会自动生成监控报告，可以通过访问web页面的报告页面查看，如下图：</font>

**<font style="color:rgb(51, 51, 51);">1、</font>**[grafana](https://cloud.tencent.com/product/tcmg?from=10680)**<font style="color:rgb(51, 51, 51);">测试结果</font>**

![1659833132774-e00f2334-d495-42d8-b75b-59395413e82d.png](./img/ts2LY4GQn7o3ZRQM/1659833132774-e00f2334-d495-42d8-b75b-59395413e82d-913248.png)

**<font style="color:rgb(51, 51, 51);">2、easyNmon监控报告</font>**

![1659833132892-72bcc049-cb34-4b86-8224-fe44cb1c8006.png](./img/ts2LY4GQn7o3ZRQM/1659833132892-72bcc049-cb34-4b86-8224-fe44cb1c8006-876688.png)

<font style="color:rgb(77, 77, 77);"></font>



> 更新: 2022-08-07 08:50:22  
> 原文: <https://www.yuque.com/lixinsi/gpngnc/qgi31i>
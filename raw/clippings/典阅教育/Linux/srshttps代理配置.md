# srshttps代理配置

### 基于srs开源推流系统的https代理使用nginx
#### 系统环境centos7版本
#### 所需安装包版本nginx-1.9.7.tar openssl-1.0.2d.tar srs4.0
#### 1.安装包下载目录
```bash
cd /usr/local/src
```



#### 2.srs常用命令
```bash
#trunk目录下启动srs
./etc/init.d/srs start

#trunk目录下重载srs
./etc/init.d/srs reload

#查看srs进程
 ps -ef | grep srs

 #启动服务
 ./objs/srs -c conf/srs.conf
```

```bash
 
    2  ll
    3  cd srs/
    4  ll
    5  ./etc/init.d/srs start
    6  cd ../
    7  ./etc/init.d/srs start
    8  cd srs/
    9  ll
   10  cd trunk/
   11  ll
   12  ./etc/init.d/srs start
   13  ll
   14  cd ../
   15  ll
   16  cd ../
   17  ll
   18  cd nginx/
   19  ll
   20  cd ../
   21  ll
   22  cd  etc/
   23  ll
   24  cd ../
   25  ll
   26  cd /usr/local/
   27  ll
   28  cd /usr/local/src/
   29  ll
   30  cd openssl/
   31  openssl genrsa -des3 -out server.key 2048
   32  openssl req -new -key server.key -out server.csr -subj "/C=CN/ST=Zhejiang/L=Hangzhou/O=mofei/OU=mofei/CN=192.168.5.147"
   33  ll
   34  openssl rsa -in server.key -out server.key
   35  openssl x509 -req -days 3650 -in server.csr -signkey server.key -out server.crt
   36  ll
   37  pwd
   38  cd ../l
   39  cd ../
   40  ll
   41  cd srs/
   42  ll
   43  cd trunk/
   44  ll
   45  ./etc/init.d/srs start
   46  ip addr
   47  ./etc/init.d/srs start
   48  ./etc/init.d/srs -s stop
   49  ./etc/init.d/srs reload
   50  ipconfig
   51  yum search ipconfig
   52  ip addr
   53  systemctl disable firewalld
   54  systemctl stop firewalld
   55  ./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_v2_module
   56  ll
   57  cd /usr/local/
   58  cd src/
   59  ./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_v2_module
   60  cd nginx/
   61  cd nginx-1.13.7
   62  ./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_v2_module
   63  make
   64  /usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/srsnginx.conf
   65  ll
   66  cd ../
   67  ../
   68  ll
   69  ccd openssl/
   70  cd /usr/local/nginx/sbin/
   71  ll
   72  cd /usr/local/nginx/
   73  ll
   74  cd conf/
   75  ll
   76  cd /usr/local/src/srs/
   77  ll
   78  cd trunk/
   79  ll
   80  cd conf
   81  openssl genrsa -des3 -out server.key 2048
   82  ll
   83  openssl req -new -key server.key -out server.csr -subj "/C=CN/ST=Zhejiang/L=Hangzhou/O=mofei/OU=mofei/CN=www.ffcc.com"
   84  subj参数说明如下：
   85  openssl req -new -key server.key -out server.csr -subj "/C=CN/ST=Zhejiang/L=Hangzhou/O=mofei/OU=mofei/CN=www.ffcc.com"
   86  openssl rsa -in server.key -out server.key
   87  cd ../
   88  ll
   89  cd ../
   90  ll
   91  cd openssl/
   92  ll
   93  pwd
   94  whereis nginx
   95  cd /usr/local/nginx/
   96  cd sbin/
   97  ./nginx 
   98  /usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/srsnginx.conf
   99  ./nginx 
  100  /usr/local/nginx/sbin/nginx -V
  101  ./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_v2_module 
  102  cd /usr/local/
  103  ll
  104  cd src/
  105  ll
  106  cd nginx/
  107  ./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_v2_module 
  108  cd nginx-1.13.7
  109  ./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_v2_module 
  110  /usr/local/nginx/sbin/nginx -V
  111  sudo yum install yum-utils
  112  [nginx-stable]
  113  name=nginx stable repo
  114  baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
  115  gpgcheck=1
  116  enabled=1
  117  gpgkey=https://nginx.org/keys/nginx_signing.key
  118  module_hotfixes=true
  119   
  120  [nginx-mainline]
  121  name=nginx mainline repo
  122  baseurl=http://nginx.org/packages/mainline/centos/$releasever/$basearch/
  123  gpgcheck=1
  124  enabled=0
  125  gpgkey=https://nginx.org/keys/nginx_signing.key
  126  module_hotfixes=true
  127  vi /etc/yum.repos.d/nginx.repo
  128  yum-config-manager --enable nginx-mainline
  129  yum install nginx
  130  ps -ef | grep nginx
  131  /usr/sbin/nginx
  132  cd usr/local/nginx/sbin
  133  systemctl status nginx.service
  134  ./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_v2_module
  135  /usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/srsnginx.conf
  136  iptables -I INPUT -p tcp --dport 8080 -j ACCEPT
  137  iptables -I INPUT -p udp --dport 5060 -j ACCEPT
  138  iptables-save
  139  ./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_v2_module
  140  make
  141  /usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/srsnginx.conf
  142  cd /usr/local/nginx/conf/
  143  ll
  144  touch srsnginx.conf
  145  /usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/srsnginx.conf
  146  vi srsnginx.conf 
  147  /usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/srsnginx.conf
  148  ll
  149  vi nginx.conf
  150  /usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/srsnginx.conf
  151  cd ../
  152  ll
  153  cd sbin/
  154  ./nginx exit
  155  ./nginx 
  156  mv /usr/bin/openssl  /usr/bin/openssl.old
  157  cd ../
  158  ll
  159  cd src/
  160  ll
  161  cd openssl/
  162  ll
  163  wget https://www.openssl.org/source/openssl-1.1.0f.tar.gz
  164  ll
  165  yum -y install make gcc zlib zlib-devel openssl openssl-devel pcre pcre-devel
  166  yum -y install gcc wget automake autoconf libtool libxml2-devel libxslt-devel perl-devel perl-ExtUtils-Embed pcre-devel openssl-devel
  167  ps aux|grep nginx
  168  cd ../
  169  ll
  170  cd ,,.
  171  killall -9 nginx
  172  kill -9 nginx
  173  killall -9 nginx
  174  cd nginx/
  175  cd sb
  176  ll
  177  cd nginx-1.13.7
  178  ll
  179  cd /usr/local/sbin/
  180  ll
  181  cd /usr/
  182  ll
  183  cd sbin/
  184  ll
  185  cd nginx
  186  whereis nginx
  187  cd /usr/sbin/nginx
  188  cd /usr/sbin/
  189  ./nginx -s stop
  190  whereis nginx
  191  find / -name nginx
  192  rm -rf /etc/nginx /etc/logrotate.d/nginx /var/log/nginx
  193  /var/cache/nginx
  194  /usr/sbin/nginx
  195  /usr/lib64/nginx
  196  /usr/share/nginx
  197  /usr/libexec/initscripts/legacy-actions/nginx
  198  /usr/local/src/srs/trunk/objs/nginx
  199  /usr/local/src/nginx
  200  /usr/local/src/nginx/nginx-1.13.7/objs/nginx
  201  /usr/local/nginx
  202  /usr/local/nginx/sbin/nginx
  203  rm -rf /etc/nginx
  204  rm -rf /etc/logrotate.d/nginx
  205  rm -rf /var/cache/nginx /usr/sbin/nginx /usr/lib64/nginx /usr/share/nginx /usr/libexec/initscripts/legacy-actions/nginx
  206  rm -rf /usr/local/src/srs/trunk/objs/nginx /usr/local/src/nginx /usr/local/src/nginx/nginx-1.13.7/objs/nginx /usr/local/nginx /usr/local/nginx/sbin/nginx
  207  cd ../
  208  cd src/
  209  ll
  210  pwd
  211  yum remove nginx
  212  rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
  213  yum install -y nginx
  214  nginx -v
  215  cd /etc/nginx/
  216  ll
  217  cat nginx.conf 
  218  cd ../
  219  ll
  220  cd /etc/nginx/
  221  pwd
  222  cd ../
  223  ll
  224  cd /usr/local/
  225  ll
  226  cd src/
  227  ll
  228  cd /etc/nginx/
  229  ll
  230  systemctl start nginx.service
  231  systemctl status nginx
  232  whereis nginx
  233  rm -rf /usr/sbin/nginx /usr/lib64/nginx /etc/nginx /usr/share/nginx /usr/share/man/man8/nginx.8.gz
  234  yum remove nginx
  235  cd /usr/local/src wget http://nginx.org/download/nginx-1.9.7.tar.gz
  236   wget http://nginx.org/download/nginx-1.9.7.tar.gz
  237  ll
  238  tar zxvf nginx-1.9.7.tar.gz
  239  cd nginx-1.9.7
  240  ./configure --user=www --group=www --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_gzip_static_module --add-module=../ngx_cache_purge-2.3 --with-http_v2_module
  241  make
  242  echo $?
  243  ./configure --user=www --group=www --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_v2_module --with-http_gzip_static_module --with-http_sub_module --with-stream --with-stream_ssl_module --with-openssl-opt='enable-weak-ssl-ciphers'
  244  ————————————————
  245                              版权声明：本文为博主原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接和本声明。
  246                          
  247  原文链接：https://blog.csdn.net/ChinaHacker995/article/details/113538789
  248  ./configure --user=www --group=www --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_v2_module --with-http_gzip_static_module --with-http_sub_module --with-stream --with-stream_ssl_module --with-openssl-opt='enable-weak-ssl-ciphers'
  249  make
  250  cd /usr/local/nginx
  251  whereis nginx
  252  ll
  253  cd conf
  254  ll
  255  cd ../
  256  cd /usr/local/
  257  ll
  258  cd sbin/
  259  mv nginx nginx.bak
  260  ll
  261  cd /usr/local/src/
  262  ll
  263  cd nginx-1.9.7
  264  make install
  265  whereis nginx
  266  cd /usr/local/nginx/
  267  ll
  268  cd sbin/
  269  ll
  270  pwd
  271  mv nginx nginx.back
  272  ./nginx -v
  273  ./nginx -version
  274  ./nginx
  275  ll
  276  mv nginx nginx
  277  mv nginx.back nginx
  278  ll
  279  ./nginx -v
  280  yum install gcc\* pcre\* zlib\* –y
  281  whereis src
  282  pwd
  283  whereis nginx1.9.7
  284  ll
  285  cd ../
  286  ll
  287  cd ../
  288  ll
  289  cd ../
  290  ll
  291  cd /usr/
  292  ll
  293  cd local/
  294  ll
  295  cd nginx/
  296  ll
  297  cd ../
  298  cd src/
  299  ll
  300  pwd
  301  cd nginx-1.9.7
  302  pwd
  303  cd ../
  304  ll
  305  tar -xvf openssl-1.0.2d.tar.gz 
  306  cd openssl-1.0.2d
  307  ll
  308  pwd
  309  cd ../
  310  cd nginx-1.9.7
  311  ./configure --prefix=/usr/local/nginx --with-openssl=/usr/local/src/openssl-1.0.2d --with-http_stub_status_module --with-http_ssl_module --with-http_gzip_static_module
  312  make && make install
  313  cd ..
  314  rm -fr openssl* nginx*
  315  service iptables stop
  316  cd /usr/local/nginx
  317  ./sbin/nginx
  318  ./sbin/nginx -stop
  319  ./sbin/nginx -s stop
  320  pwd
  321  ll
  322  cd conf/
  323  ll
  324  mkdir ssl
  325  ssh -v
  326  openssl version
  327  pwd
  328  cd ssl/
  329  pwd
  330  wget https://www.openssl.org/source/openssl-1.1.1n.tar.gz
  331  tar -vxf openssl-1.1.1n.tar.gz 
  332  cd openssl-1.1.1n
  333  ./config --prefix=/usr/local/openssl threads zlib shared enable-camellia
  334  make && make install
  335  openssl version
  336  ssh -v
  337  mv /usr/bin/openssl /usr/bin/openssl.bak-$(date +%m%d)
  338  ln -s /usr/local/openssl/bin/openssl /usr/bin/openssl
  339  echo "/usr/local/openssl/lib">>/etc/ld.so.conf
  340  ldconfig
  341  openssl version
  342  cd  /usr/local/nginx/conf/ssl/
  343  openssl genrsa -des3 -out server.key 2048
  344  ll
  345  ipconfig
  346  ip addr
  347  openssl req -new -key server.key -out server.csr -subj "/C=CN/ST=Hnnan/L=Changsha/O=Compa/OU=test/CN=192.168.5.147"
  348  ll
  349  openssl rsa -in server.key -out server.key
  350  openssl x509 -req -days 3650 -in server.csr -signkey server.key -out server.crt
  351  ll
  352  cd ../
  353  ll
  354  vi nginx.conf
  355  pwd
  356  nginx -v
  357  ll
  358  cd ../
  359  ll
  360  cd sbin/
  361  ll
  362  ./nginx
  363  /usr/local/nginx/sbin/nginx -V
  364  cd /usr/local/src/nginx-1.9.7
  365  cd /usr/local/src/
  366  ll
  367  cd /usr/local/src
  368  ll
  369  tar -xzf nginx-1.9.7.tar.gz 
  370  ll
  371  cd nginx-1.9.7
  372  ll
  373  tar zxvf nginx-1.9.7.tar.gz
  374  cd ../
  375  tar zxvf nginx-1.9.7.tar.gz
  376  cd nginx-1.9.7
  377  ./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_v2_module
  378  make
  379  cp /usr/local/nginx/sbin/nginx /usr/local/nginx/sbin/nginx.bak
  380  cp ./objs/nginx /usr/local/nginx/sbin/
  381  cd /usr/local/nginx/sbin/
  382  ./nginx
  383  /usr/local/nginx/sbin/nginx -V
  384  cd /usr/local/src/nginx-1.9.7
  385  ./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_v2_module
  386  make
  387  cp /usr/local/nginx/sbin/nginx /usr/local/nginx/sbin/nginx.bak
  388  cd /usr/local/nginx/sbin
  389  ./nginx
  390  ./nginx -t
  391  nginx -V--with-http_ssl_module
  392  nginx -V --with-http_ssl_module
  393  cd  /usr/local/nginx/conf
  394  vi nginx.conf
  395  /usr/local/nginx/sbin/nginx -V
  396  cd ../
  397  ll
  398  cd src/
  399  ./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_v2_module 
  400  cd nginx-1.9.7
  401  ./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_v2_module 
  402  make
  403  cp /usr/local/nginx/sbin/nginx /usr/local/nginx/sbin/nginx.bak
  404  cp ./objs/nginx /usr/local/nginx/sbin/
  405  cd /usr/local/nginx/sbin
  406  ./nginx
  407  ./nginx -s stop
  408  cd /usr/local/nginx/conf
  409  vi nginx.conf
  410  cd /usr/local/nginx/sbin
  411  ./nginx reload
  412  ./nginx -s stop
  413  ./nginx 
  414  ./nginx -s reload
  415  ./nginx -s stop
  416  ./nginx
  417  cd /usr/local/
  418  cd src/
  419  cd srs/
  420  cd trunk/
  421  ./etc/init.d/srs start
  422  ll
  423  cd conf
  424  ll
  425  vi srs.conf 
  426  cd ../
  427  ll
  428  ./etc/init.d/srs 
  429  ./etc/init.d/srs reload
  430  cd /usr/local/nginx/sbin
  431  ./nginx -s stop
  432  cd /usr/local/src/srs/
  433  ll
  434  cd trunk/
  435  ./etc/init.d/srs reload
  436  ./configure && make
  437  ./objs/srs -c conf/srs.conf
  438  ps -ef | grep srs
  439  cd /usr/local/nginx/sbin
  440  ./nginx
  441  history 
```



> 更新: 2024-02-23 12:55:47  
> 原文: <https://www.yuque.com/lixinsi/gpngnc/ar1bbwye4lym90t0>
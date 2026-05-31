# Kubernetes 安装 kubeadm

## <font style="color:rgb(51, 51, 51);">事先准备</font>
+ <font style="color:rgb(51, 51, 51);">多台Ubuntu 16.04+、CentOS 7或HypriotOS v1.0.1 + 系统</font>
+ <font style="color:rgb(51, 51, 51);">每台机器最少1GB+内存</font>
+ <font style="color:rgb(51, 51, 51);">集群中所有机器之间网络连接正常</font>
+ <font style="color:rgb(51, 51, 51);">每个节点有唯一MAC地址和product_uuid</font>
+ <font style="color:rgb(51, 51, 51);">打开某些端口。请参阅以下部分</font>

<font style="color:rgb(51, 51, 51);"></font>

## <font style="color:rgb(51, 51, 51);">检查所需端口</font>
### <font style="color:rgb(51, 51, 51);">Master节点</font>
| **<font style="color:rgb(51, 51, 51);">端口范围</font>** | **<font style="color:rgb(51, 51, 51);">用途</font>** |
| :--- | :--- |
| <font style="color:rgb(51, 51, 51);">6443 *</font> | <font style="color:rgb(51, 51, 51);">Kubernetes API server</font> |
| <font style="color:rgb(51, 51, 51);">2379-2380</font> | <font style="color:rgb(51, 51, 51);">etcd server client API</font> |
| <font style="color:rgb(51, 51, 51);">10250</font> | <font style="color:rgb(51, 51, 51);">Kubelet API</font> |
| <font style="color:rgb(51, 51, 51);">10251</font> | <font style="color:rgb(51, 51, 51);">kube-scheduler</font> |
| <font style="color:rgb(51, 51, 51);">10252</font> | <font style="color:rgb(51, 51, 51);">kube-controller-manager</font> |
| <font style="color:rgb(51, 51, 51);">10255</font> | <font style="color:rgb(51, 51, 51);">Read-only Kubelet API (Heapster)</font> |


### <font style="color:rgb(51, 51, 51);">工作节点</font>
| **<font style="color:rgb(51, 51, 51);">端口范围</font>** | **<font style="color:rgb(51, 51, 51);">用途</font>** |
| :--- | :--- |
| <font style="color:rgb(51, 51, 51);">10250</font> | <font style="color:rgb(51, 51, 51);">Kubelet API</font> |
| <font style="color:rgb(51, 51, 51);">10255</font> | <font style="color:rgb(51, 51, 51);">Read-only Kubelet API (Heapster)</font> |
| <font style="color:rgb(51, 51, 51);">30000-32767</font> | [NodePort Services](https://kubernetes.io/docs/concepts/services-networking/service)<br/><font style="color:rgb(51, 51, 51);">默认端口范围</font> |


1、开放端口



firewall-cmd --zone=public --add-port=5672/tcp --permanent   # 开放5672端口



firewall-cmd --zone=public --remove-port=5672/tcp --permanent  #关闭5672端口



firewall-cmd --reload   # 配置立即生效



2、查看防火墙所有开放的端口



firewall-cmd --zone=public --list-ports



3.、关闭防火墙



如果要开放的端口太多，嫌麻烦，可以关闭防火墙，安全性自行评估



systemctl stop firewalld.service



4、查看防火墙状态



 firewall-cmd --state



 禁用防火墙（系统启动时不启动防火墙服务）

[root@lvxinghao ~]# systemctl disable firewalld

[root@lvxinghao ~]# systemctl is-enabled firewalld 



5、查看监听的端口

netstat -lnpt



> 更新: 2022-06-22 16:02:20  
> 原文: <https://www.yuque.com/lixinsi/ii9bf8/cw5fz6>
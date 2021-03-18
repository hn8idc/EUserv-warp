## EUserv IPV6添加WARP IPV4项目（已测试通过Debian 10、Ubuntu 20.04）

### 脚本仅针对OpenVZ、LXC架构的IPV6 only VPS添加WARP IPV4网络支持，默认已设置IPV4优先

### 详细教程及探讨：

## 步骤

### 一、登陆SSH（PC WIN系统）

方法1、电脑本地隧道

方法2、IPV4跳板机

方法3、嘿呦终端（可不设置DNS64）


### 二、配置DNS64
echo -e "nameserver 2001:67c:2b0::4\nnameserver 2001:67c:2b0::6" > /etc/resolv.conf


### 三、复制相应脚本，一键到底！



### Debian 10系统
```
wget https://raw.githubusercontent.com/YG-tsj/EUserv-addv4-warp/main/db.sh && chmod +x db.sh && ./db.sh
```

### Ubuntu 20.04系统
```
wget https://raw.githubusercontent.com/YG-tsj/EUserv-addv4-warp/main/ub.sh && chmod +x ub.sh && ./ub.sh
```

## EUserv IPV6添加WARP IPV4项目（已测试通过Debian 10、Ubuntu 20.04）

### 脚本仅针对OpenVZ、LXC架构的IPV6 only VPS,添加WARP IPV4网络支持，默认已设置IPV4优先


### 详细视频教程及探讨：

------------------------------------------------------------------------------------
## 步骤如下

### 一、登陆SSH（PC WIN系统）

开启IPV6网络方法

方法1、电脑本地隧道

方法2、IPV4跳板机

方法3、嘿呦终端

有IPV6地址的直接登陆！

### 二、配置DNS64
echo -e "nameserver 2001:67c:2b0::4\nnameserver 2001:67c:2b0::6" > /etc/resolv.conf


### 三、水平有限没有合并，请复制相应系统的脚本，一键到底！



### Debian 10系统
```
wget https://raw.githubusercontent.com/YG-tsj/EUserv-addv4-warp/main/db.sh && chmod +x db.sh && ./db.sh
```

### Ubuntu 20.04系统
```
wget https://raw.githubusercontent.com/YG-tsj/EUserv-addv4-warp/main/ub.sh && chmod +x ub.sh && ./ub.sh
```

### 感谢P3terx大及原创者们，参考来源：
https://p3terx.com/archives/debian-linux-vps-server-wireguard-installation-tutorial.html

https://p3terx.com/archives/use-cloudflare-warp-to-add-extra-ipv4-or-ipv6-network-support-to-vps-servers-for-free.html

https://luotianyi.vc/5252.html

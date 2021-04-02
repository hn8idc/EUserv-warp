# 2021.4.1更新中

### EUserv IPV6添加WARP IPV4，脚本仅针对OpenVZ、LXC架构的IPV6 only VPS，添加WARP IPV4网络支持，默认已设置WARP IPV4优先

## 原先详细视频教程及探讨：https://youtu.be/78dZgYFS-Qo

## 最新德鸡EUserv-DIG9危机教程及探讨视频发布：即将…………

-------------------------------------------------------------------------------------------------------
### 原先WARP德鸡EUserv教程发布没多久，德鸡开始封杀传统方案（更改DNS/NAT64来获取IPV4的网络），现只让使用IPV6来下载及访问，以封杀IPV4！

### 好吧！如此就来个统一！不管你进入SSH后显示的是root@DIG9与root@srv数字，我们一率不用DNS64，且我们就只走IPV6！

## 注意点及步骤如下：

#### 一：恢复官方DNS64（重装系统者，可直接跳到第二步）
```
echo -e "search blue.kundencontroller.de\noptions rotate\nnameserver 2a02:180:6:5::1c\nnameserver 2a02:180:6:5::4\nnameserver 2a02:180:6:5::1e\nnameserver 2a02:180:6:5::1d" > /etc/resolv.conf
```

#### 二、无须添加DNS64！！！Debian 10/Ubuntu 20.04系统脚本（已添加IPV6直接支持）,一键到底！
```
wget -qO- https://cdn.jsdelivr.net/gh/YG-tsj/EUserv-addv4-warp/srvDIG9.sh|bash
```

### 推荐用mack-a，phlinhng两大IPV6 Xray脚本。

mack-a：https://github.com/mack-a/v2ray-agent

phlinhng：https://github.com/phlinhng/v2ray-tcp-tls-web

------------------------------------------------------------------------------------------------------------- 
 
# 第三部分：临时或关闭打开Warp ipv4、验证优先级

### 由于默认设置WARP IPV4优先，可能你有时不希望WARP IPV4优先，那么可以先关，再开（虽然重启后会自动打开）

手动关闭WARP网络接口
```
wg-quick down wgcf
```

手动开启WARP网络接口 
```
wg-quick up wgcf
```

查看WARP当前统计状态
```
wg
```

### 验证IP优先级(验证功能已集成脚本结尾)
```
curl ip.p3terx.com
```

---------------------------------------------------------------------------------------------------------------------

感谢P3terx大及原创者们，参考来源：
 
https://p3terx.com/archives/debian-linux-vps-server-wireguard-installation-tutorial.html

https://p3terx.com/archives/use-cloudflare-warp-to-add-extra-ipv4-or-ipv6-network-support-to-vps-servers-for-free.html

https://luotianyi.vc/5252.html

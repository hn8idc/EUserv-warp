
### EUserv IPV6添加WARP IPV4，脚本仅针对OpenVZ、LXC架构的IPV6 only VPS，添加WARP IPV4网络支持，默认已设置WARP IPV4优先

### 原先详细视频教程及探讨：https://youtu.be/78dZgYFS-Qo

### 最新德鸡EUserv-DIG9危机教程及探讨发布：即将…………

-------------------------------------------------------------------------------------------------------
### 德鸡EUserv开始封杀传统方案（更改DNS/NAT64来获取IPV4网络），仅允许IPV6下载及访问！

### 好吧！被倒逼成这样，那就来个统一！不管你进入SSH后显示的是root@DIG9与root@srv数字，我们一率不添加DNS64！！

### 简单步骤如下，详情分析移步上面视频：

#### 一：恢复官方DNS64（重装系统者，可直接跳到第二步脚本安装）
```
echo -e "search blue.kundencontroller.de\noptions rotate\nnameserver 2a02:180:6:5::1c\nnameserver 2a02:180:6:5::4\nnameserver 2a02:180:6:5::1e\nnameserver 2a02:180:6:5::1d" > /etc/resolv.conf
```

#### 二、无须添加DNS64！！！Debian 10/Ubuntu 20.04系统脚本（已添加IPV6直接支持）,一键到底！
```
wget -qO- https://cdn.jsdelivr.net/gh/YG-tsj/EUserv-addv4-warp/srvDIG9.sh|bash
```

#### 推荐用mack-a，phlinhng两大IPV6 Xray脚本。

1、mack-a 脚本：
```
wget -P /root -N --no-check-certificate "https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh" && chmod 700 /root/install.sh && /root/install.sh

```
再次进入管理菜单：
```
vasma
```

2、phlinhng 脚本：
```
curl -fsSL https://raw.staticdn.net/phlinhng/v2ray-tcp-tls-web/main/src/xwall.sh -o ~/xwall.sh && bash ~/xwall.sh
```
再次进入管理菜单：
```
bash ~/xwall.sh
```

------------------------------------------------------------------------------------------------------------- 
 
### 临时或关闭打开Warp ipv4、验证优先级

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

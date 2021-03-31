# 2021.3.31更新中，后续还有变………………

### EUserv IPV6添加WARP IPV4，脚本仅针对OpenVZ、LXC架构的IPV6 only VPS，添加WARP IPV4网络支持，默认已设置WARP IPV4优先

## 最新德鸡EUserv-DIG9危机教程视频发布：待定…………

-------------------------------------------------------------------------------------------------------
# 第一部分：以下内容仅针对root@DIG9用户（觉得麻烦，可以直接用第二部分的脚本）

#### 一：建议使用debain系统，不要添加DNS64,不要添加DNS64,不要添加DNS64

#### 二、准备三个文件
可直接在本项目中下载这三个文件，如要最新版请下载1与2

1、wgcf官方最新下载：https://github.com/ViRb3/wgcf/releases 选择linux_amd64 重命名为wgcf 

2、wireguard-go P3大最新下载：https://github.com/P3TERX/wireguard-go-builder/releases 选择linux-amd64.tar.gz 解压后重命名为wireguard-go

3、EUdig9.sh脚本文件自行下载

以上三个文件直接拖到德鸡/root目录上

#### 三、直接运行脚本：
```
chmod +x EUdig9.sh && ./EUdig9.sh
```

### 推荐用mack-a，phlinhng两大IPV6 Xray脚本。

mack-a：https://github.com/mack-a/v2ray-agent

phlinhng：https://github.com/phlinhng/v2ray-tcp-tls-web

------------------------------------------------------------------------------------—----------------------------------------

# 第二部分：以下内容仅针对root@srvXXXXX用户

## 详细视频教程及探讨：https://youtu.be/78dZgYFS-Qo

#### 一、无须添加DNS/NAT64，直接运行以下脚本

#### 二、Debian 10/Ubuntu 20.04系统脚本（已添加IPV6直接支持）,一键到底！
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
感谢杀鸡取卵方案原作者F大！参考来源：
 
项目地址：https://github.com/fscarmen/warp/tree/main/DiG9


感谢P3terx大及原创者们，参考来源：
 
https://p3terx.com/archives/debian-linux-vps-server-wireguard-installation-tutorial.html

https://p3terx.com/archives/use-cloudflare-warp-to-add-extra-ipv4-or-ipv6-network-support-to-vps-servers-for-free.html

https://luotianyi.vc/5252.html

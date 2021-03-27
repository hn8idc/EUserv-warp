

## EUserv IPV6添加WARP IPV4

### 脚本仅针对OpenVZ、LXC架构的IPV6 only VPS，添加WARP IPV4网络支持，默认已设置WARP IPV4优先

### 已测试通过Debian 10、Ubuntu 20.04，推荐用ProxySU，mack-a，phlinhng三大IPV6 Xray脚本。
mack-a：https://github.com/mack-a/v2ray-agent

phlinhng：https://github.com/phlinhng/v2ray-tcp-tls-web

ProxySU：https://github.com/proxysu/ProxySU

### 详细视频教程及探讨：https://youtu.be/78dZgYFS-Qo

------------------------------------------------------------------------------------

#### Debian 10/Ubuntu 20.04系统脚本,一键到底！
```
wget https://raw.githubusercontent.com/YG-tsj/EUserv-addv4-warp/main/ub20db10.sh && chmod +x ub20db10.sh && ./ub20db10.sh
```

#### 由于默认设置WARP IPV4优先，可能你有时不希望WARP IPV4优先（比如有些脚本申请证书识别报错），那么可以先关，再开（虽然重启后自动会开）

手动关闭WARP网络接口
```
wg-quick down wgcf
```

手动开启WARP网络接口 
```
wg-quick up wgcf
```

查看WARP当前状态
```
wg
```

#### 安装完脚本后，如末尾提示：
job for wg-quick@ wgcf.service failed because the control process exited with error code.
See "systemctl status wg-quick@ wgcf.service" and "journalctl -xe" for details。    
说明没成功，继续重装脚本，直到没提示为止！！
---------------------------------------------------------------------------------------------------------------------



### 感谢P3terx大及原创者们，参考来源：
https://p3terx.com/archives/debian-linux-vps-server-wireguard-installation-tutorial.html

https://p3terx.com/archives/use-cloudflare-warp-to-add-extra-ipv4-or-ipv6-network-support-to-vps-servers-for-free.html

https://luotianyi.vc/5252.html

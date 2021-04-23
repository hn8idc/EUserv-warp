
#### 给EUserv IPV6添加WARP单IPV4或者双栈IPV6+IPV4，针对OpenVZ、LXC架构的IPV6 only VPS！

#### ipv6 only VPS添加WARP的好处：

1：使只有IPV6的VPS获取访问IPV4的能力，套上WARP的ip,变成双栈VPS！

2：基本能隐藏VPS的真实IP！

3：支持直连电报Telegram，支持软路由Openwrt各种翻墙插件！

4：WARP双栈IPV6+IPV4都支持奈非Netflix流媒体，无视原IP限制！

5：支持原本需要IPV4支持的Docker等应用！

6：加速VPS到CloudFlare CDN节点访问速度！

7：避开原VPS的IP需要谷歌验证码问题！

8：替代HE tunnelbroker隧道方案，网络效率更高！

9：替代NAT64/DNS64方案，网络效率更高！

#### 原先详细视频教程及探讨：https://youtu.be/78dZgYFS-Qo

#### 最新德鸡EUserv抛弃DNS64、自定义域名、IP分流教程（推荐）：https://youtu.be/fY9HDLJ7mnM

#### 联合Oracle甲骨文https://github.com/YG-tsj/Oracle-warp #双栈Warp接管IPV4与IPV6网络：稍后更新
-------------------------------------------------------------------------------------------------------

##### 一：恢复EUserv官方DNS64（重装系统者，可直接跳到第二步脚本安装）
```
echo -e "search blue.kundencontroller.de\noptions rotate\nnameserver 2a02:180:6:5::1c\nnameserver 2a02:180:6:5::4\nnameserver 2a02:180:6:5::1e\nnameserver 2a02:180:6:5::1d" > /etc/resolv.conf
```

##### 二、重装系统能解决99%的问题！无须添加DNS64！WARP单-双栈ipv4+ipv6脚本

##### 仅支持Debian 10/Ubuntu 20.04系统

##### 根据自己需求选择脚本1或者脚本2（有无成功可查看脚本末尾提示）

##### 脚本1：Warp仅接管IPV4网络，本地IPV6网络不变
```
wget -qO- https://cdn.jsdelivr.net/gh/YG-tsj/EUserv-warp/warp4.sh|bash
```

##### 脚本2：Warp接管IPV4与IPV6网络
```
wget -qO- https://cdn.jsdelivr.net/gh/YG-tsj/EUserv-warp/warp64.sh|bash
```

--------------------------------------------------------------------------------------------------------------

##### 查看WARP当前统计状态
```
wg
```

##### 提示：配置文件wgcf.conf和注册文件wgcf-account.toml都已备份在/etc/wireguard目录下！

------------------------------------------------------------------------------------------------------------- 
##### IPV6 VPS专用分流配置文件(以下默认全局IPV4优先，IP、域名自定义，详情见视频教程)
```
{ 
"outbounds": [
    {
      "tag":"IP6-out",
      "protocol": "freedom",
      "settings": {}
    },
    {
      "tag":"IP4-out",
      "protocol": "freedom",
      "settings": {
        "domainStrategy": "UseIPv4" 
      }
    }
  ],
  "routing": {
    "rules": [
      {
        "type": "field",
        "outboundTag": "IP4-out",
        "domain": [""] 
      },
      {
        "type": "field",
        "outboundTag": "IP6-out",
        "network": "udp,tcp" 
      }
    ]
  }
}
``` 

 ---------------------------------------------------------------------------------------------------------

#### 相关WARP进程命令

手动临时关闭WARP网络接口
```
wg-quick down wgcf
```
手动开启WARP网络接口 
```
wg-quick up wgcf
```

启动systemctl enable wg-quick@wgcf

开始systemctl start wg-quick@wgcf

重启systemctl restart wg-quick@wgcf

停止systemctl stop wg-quick@wgcf

关闭systemctl disable wg-quick@wgcf


---------------------------------------------------------------------------------------------------------------------

感谢P3terx大及原创者们，参考来源：
 
https://p3terx.com/archives/debian-linux-vps-server-wireguard-installation-tutorial.html

https://p3terx.com/archives/use-cloudflare-warp-to-add-extra-ipv4-or-ipv6-network-support-to-vps-servers-for-free.html

https://luotianyi.vc/5252.html

https://hiram.wang/cloudflare-wrap-vps/

#!/bin/bash

apt update && apt install curl sudo lsb-release iptables -y
echo "deb http://deb.debian.org/debian $(lsb_release -sc)-backports main" | sudo tee /etc/apt/sources.list.d/backports.list
apt update
apt install net-tools iproute2 openresolv dnsutils -y
apt install wireguard-tools --no-install-recommends
wget -N -P /usr/bin https://github.com/YG-tsj/EUserv-addv4-warp/blob/main/wireguard-go
curl -fsSL git.io/wgcf.sh | sudo bash
chmod +x /usr/local/bin/wgcf
echo | wgcf register
wgcf generate
sed -i 's/engage.cloudflareclient.com/2606:4700:d0::a29f:c001/g' wgcf-profile.conf
sed -i '/\:\:\/0/d' wgcf-profile.conf
cp wgcf-profile.conf /etc/wireguard/wgcf.conf
systemctl enable wg-quick@wgcf
systemctl start wg-quick@wgcf
echo 'precedence  ::ffff:0:0/96   100' | sudo tee -a /etc/gai.conf
echo -e "检测是否启动优先IPV4地址，如果下方显示8.20.xxx.xxx的Cloudflare net地址，就说明一切都成功啦！……否则，再重新运行脚本吧"
curl ip.p3terx.com

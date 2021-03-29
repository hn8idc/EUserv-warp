#!/bin/bash

apt update && apt install curl sudo lsb-release iptables -y
echo "deb http://deb.debian.org/debian $(lsb_release -sc)-backports main" | sudo tee /etc/apt/sources.list.d/backports.list
apt update
apt install net-tools iproute2 openresolv dnsutils -y
apt install wireguard-tools --no-install-recommends
curl -fsSL git.io/wireguard-go.sh | sudo bash
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
echo -e "完成了，可以 ping 1.1.1.1 试试看了\n如果没出问题，这里应该能显示你的IP：$(wget -qO- ipv4.ip.sb) <=如果这里是空的，大概是失败了"

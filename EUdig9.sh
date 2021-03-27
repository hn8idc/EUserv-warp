#!/bin/bash
apt update && apt install curl sudo lsb-release iptables -y
echo "deb http://deb.debian.org/debian $(lsb_release -sc)-backports main" | sudo tee /etc/apt/sources.list.d/backports.list
apt update
apt install net-tools iproute2 openresolv dnsutils -y
apt install wireguard-tools --no-install-recommends
cp wireguard-go /usr/bin
cp wgcf /usr/local/bin/wgcf
chmod +x /usr/bin/wireguard-go /usr/local/bin/wgcf
echo | wgcf register
wgcf generate
sed -i 's/engage.cloudflareclient.com/2606:4700:d0::a29f:c001/g' wgcf-profile.conf
sed -i '/\:\:\/0/d' wgcf-profile.conf
cp wgcf-profile.conf /etc/wireguard/wgcf.conf
systemctl start wg-quick@wgcf
systemctl enable wg-quick@wgcf
echo 'precedence  ::ffff:0:0/96   100' | sudo tee -a /etc/gai.conf

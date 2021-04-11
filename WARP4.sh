#!/bin/bash
echo -e "\033[1;5;31m 请 注 意！！！此 脚 本 仅 支 持 Ubuntu 与 Debain 系 统！ \033[0m"
apt update && apt install curl sudo lsb-release iptables -y
echo "deb http://deb.debian.org/debian $(lsb_release -sc)-backports main" | sudo tee /etc/apt/sources.list.d/backports.list
apt update
apt install net-tools iproute2 openresolv dnsutils -y
apt install wireguard-tools --no-install-recommends
wget https://bitbucket.org/ygtsj/euserv-warp/raw/8cccfd4ba639a5fa3a784e1ae37efb30e58310e4/wgcf
wget https://bitbucket.org/ygtsj/euserv-warp/raw/8cccfd4ba639a5fa3a784e1ae37efb30e58310e4/wireguard-go
cp wireguard-go /usr/bin
cp wgcf /usr/local/bin/wgcf
chmod +x /usr/local/bin/wgcf
chmod +x /usr/bin/wireguard-go
echo | wgcf register
wgcf generate
sed -i 's/engage.cloudflareclient.com/2606:4700:d0::a29f:c001/g' wgcf-profile.conf
sed -i '/\:\:\/0/d' wgcf-profile.conf
cp wgcf-profile.conf /etc/wireguard/wgcf.conf
systemctl enable wg-quick@wgcf
systemctl start wg-quick@wgcf
rm -f WARP4* wgcf* wireguard-go*
grep -qE '^[ ]*precedence[ ]*::ffff:0:0/96[ ]*100' /etc/gai.conf || echo 'precedence ::ffff:0:0/96  100' | sudo tee -a /etc/gai.conf
echo -e "\033[33m 检测是否成功启动Warp！\n 显示IPV4地址IP：$(wget -qO- ipv4.ip.sb) \033[0m"
echo -e "\033[32m 如上方显示为IP：8.2……IPV4地址，则说明成功啦！\n 如无IP显示,（说明申请WGCF账户失败），请“无限”重复运行该脚本吧，直到成功为止！！！ \033[0m"

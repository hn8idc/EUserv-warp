#!/bin/bash
echo -e "\033[31m 注意！！！重要的事说三遍：本脚本仅支持Ubuntu与Debain系统！本脚本仅支持Ubuntu与Debain系统！本脚本仅支持Ubuntu与Debain系统！ \033[0m"
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
ln -s /usr/bin/resolvectl /usr/local/bin/resolvconf
ln -sf /lib/systemd/system/systemd-resolved.service /etc/systemd/system/dbus-org.freedesktop.resolve1.service
systemctl enable wg-quick@wgcf
systemctl start wg-quick@wgcf
rm -f srvDIG9* wgcf* wireguard-go*
grep -qE '^[ ]*precedence[ ]*::ffff:0:0/96[ ]*100' /etc/gai.conf || echo 'precedence ::ffff:0:0/96  100' | sudo tee -a /etc/gai.conf
echo -e "\033[33m 检测是否优先启动Warp IPV4地址： \033[0m"
curl ip.p3terx.com
echo -e "\033[32m 如上方显示为8.2X……的IPV4地址，就说明成功啦！……如显示为2a02开头的IPV6本地地址（申请WGCF账户失败），请“无限”重复运行本脚本吧，直到成功为止 \033[0m"

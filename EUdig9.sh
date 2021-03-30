echo -e "search blue.kundencontroller.de\noptions rotate\nnameserver 2a02:180:6:5::1c\nnameserver 2a02:180:6:5::4\nnameserver 2a02:180:6:5::1e\nnameserver 2a02:180:6:5::1d" > /etc/resolv.conf
apt update && apt install curl sudo lsb-release iptables -y
echo "deb http://deb.debian.org/debian $(lsb_release -sc)-backports main" | sudo tee /etc/apt/sources.list.d/backports.list
apt update
apt install net-tools iproute2 openresolv dnsutils -y
apt install wireguard-tools --no-install-recommends
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
echo 'precedence  ::ffff:0:0/96   100' | sudo tee -a /etc/gai.conf
echo -e "检测是否优先启动Warp IPV4地址：如果下方显示为8.20……开头的IPV4地址，就说明成功啦！……否则，再重新运行脚本吧"
curl ip.p3terx.com

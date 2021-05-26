echo -e "\033[1;36m 请 注 意！脚 本 仅 支 持 Ubuntu20 与 Debain10 系 统！\n 主要针对OpenVZ、LXC架构的IPV6 only VPS！！！双栈Warp接管IPV4与IPV6网络！！！ \033[0m"
apt update && apt install curl sudo lsb-release iptables -y
echo "deb http://deb.debian.org/debian $(lsb_release -sc)-backports main" | sudo tee /etc/apt/sources.list.d/backports.list
apt update
apt -y --no-install-recommends install openresolv dnsutils wireguard-tools
wget -N -6 https://raw.githubusercontent.com/veip007/EUserv-warp/main/wgcf
wget -N -6 https://raw.githubusercontent.com/veip007/EUserv-warp/main/wireguard-go
cp wireguard-go /usr/bin
cp wgcf /usr/local/bin/wgcf
chmod +x /usr/local/bin/wgcf
chmod +x /usr/bin/wireguard-go
echo | wgcf register
wgcf generate
sed -i "5 s/^/PostUp = ip -6 rule add from $(wget -qO- ipv6.ip.sb) table main\n/" wgcf-profile.conf
sed -i "6 s/^/PostDown = ip -6 rule delete from $(wget -qO- ipv6.ip.sb) table main\n/" wgcf-profile.conf
sed -i 's/engage.cloudflareclient.com/2606:4700:d0::a29f:c001/g' wgcf-profile.conf
cp wgcf-account.toml /etc/wireguard/wgcf-account.toml
cp wgcf-profile.conf /etc/wireguard/wgcf.conf
systemctl enable wg-quick@wgcf
systemctl start wg-quick@wgcf
rm -f warp64* wgcf* wireguard-go*
grep -qE '^[ ]*label[ ]*2002::/16[ ]*2' /etc/gai.conf || echo 'label 2002::/16   2' | sudo tee -a /etc/gai.conf
echo -e "\033[1;33m 检测是否成功启动（IPV4+IPV6）双栈Warp！\n 显示IPV4地址：$(wget -qO- ipv4.ip.sb) 显示IPV6地址：$(wget -qO- ipv6.ip.sb) \033[0m"
echo -e "\033[1;32m 如上方显示IPV4地址：8.…………，IPV6地址：2a09:…………，则说明成功啦！\n 如上方IPV4无IP显示,IPV6显示本地IP（说明申请WGCF账户失败），请“无限”重复运行该脚本吧，直到成功为止！！！ \033[0m"

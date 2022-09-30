
#!/bin/bash

if [ "${EUID}" -ne 0 ]; then
echo "You need to run this script as root"
exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
echo "OpenVZ is not supported"
exit 1
fi

mkdir /etc/xray;
wget https://raw.githubusercontent.com/anzclan/MULTIPORT/main/LITE/nginx.sh && chmod +x nginx.sh && ./nginx.sh
wget https://raw.githubusercontent.com/anzclan/MULTIPORT/main/LITE/XRAY/install-xray.sh && chmod +x install-xray.sh && ./install-xray.sh

sleep 1
echo -e "[ ${green}SERVICE${NC} ] Restart All service"
systemctl daemon-reload
sleep 1
echo -e "[ ${green}SERVICE${NC} ]  Enable & restart NGINX  "
systemctl enable nginx
systemctl restart nginx
/etc/init.d/nginx restart

sleep 1
echo -e "[ ${green}SERVICE${NC} ]  Enable & restart xray "
systemctl enable xray
systemctl restart xray
systemctl restart nginx

# Status
#SELESAI
cd
echo " "
echo "Installation has been completed!!"echo " "
echo "============================================================================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------" | tee -a log-install.txt
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"  | tee -a log-install.txt
echo -e "    SCRIPT MANTAP-XRAY Multi Port"  | tee -a log-install.txt
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - SSH OpenSSH                : 22,99,169"  | tee -a log-install.txt
echo "   - SSH Dropbear               : 109,143,300,1153,"  | tee -a log-install.txt
echo "   - SSH SlowDNS                : 5300,2269,3369"  | tee -a log-install.txt
echo "   - SSH Websocket HTTP         : 80"  | tee -a log-install.txt
echo "   - SSH Websocket SSL/TLS      : 443"  | tee -a log-install.txt
echo "   - SSH Direct/HTTP/SSL        : 8000"  | tee -a log-install.txt
echo "   - SSH Stunnel5               : 8000"  | tee -a log-install.txt
echo "   - SSLH                       : 8000"  | tee -a log-install.txt
echo "   - OpenVPN TCP/Websocket      : 80,443,8000"  | tee -a log-install.txt
echo "   - Nginx                      : 89,80,443"  | tee -a log-install.txt
echo "   - XRAYS TROJAN WS TLS        : 443"  | tee -a log-install.txt
echo "   - XRAYS SHADOWSOCKS WS TLS   : 443"  | tee -a log-install.txt
echo "   - XRAYS VLESS WS TLS         : 443"  | tee -a log-install.txt
echo "   - XRAYS VMESS WS TLS         : 443"  | tee -a log-install.txt
echo "   - XRAYS TROJAN GRPC          : 443"  | tee -a log-install.txt
echo "   - XRAYS SHADOWSOCKS GRPC     : 443"  | tee -a log-install.txt
echo "   - XRAYS VMESS GRPC           : 443"  | tee -a log-install.txt
echo "   - XRAYS VLESS GRPC           : 443"  | tee -a log-install.txt
echo "   - XRAYS TROJAN WS HTTP       : 80"  | tee -a log-install.txt
echo "   - XRAYS SHADOWSOCKS WS HTTP  : 80"  | tee -a log-install.txt
echo "   - XRAYS VLESS WS HTTP        : 80"  | tee -a log-install.txt
echo "   - XRAYS VMESS WS HTTP        : 80"  | tee -a log-install.txt
echo "   - XRAYS TROJAN GRPC          : 80"  | tee -a log-install.txt
echo "   - XRAYS SHADOWSOCKS GRPC     : 80"  | tee -a log-install.txt
echo "   - XRAYS VMESS GRPC           : 80"  | tee -a log-install.txt
echo "   - XRAYS VLESS GRPC           : 80"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo " Reboot 15 Sec"
cd
sleep 15

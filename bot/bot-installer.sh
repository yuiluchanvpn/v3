#!/bin/bash
NS=$( cat /etc/xray/dns )
PUB=$( cat /etc/slowdns/server.pub )
domain=$(cat /etc/xray/domain)
#color
grenbo="\e[92;1m"
NC='\e[0m'
#install
mkdir -p /etc/jvo-script/
clear
history -c 
#color
NC='\e[0m'
u="\033[1;36m"
y="\033[1;93m"
g="\033[1;92m"
r="\033[1;91m"
NS=$( cat /etc/xray/dns )
PUB=$( cat /etc/slowdns/server.pub )
domain=$(cat /etc/xray/domain)
#install
apt update && apt upgrade
apt install neofetch -y
apt install python3 python3-pip git
echo -e "[ ${r}INFO${NC} ] = ${g}Installing Command For Bot, Please Waiting...${NC}"
sleep 2.5
cd /usr/local/sbin/
wget https://raw.githubusercontent.com/yuiluchanvpn/v3/main/bot/cmd.zip
unzip cmd.zip
chmod +x /usr/local/sbin/*
rm -rf cmd.zip
echo -e "${g}Done Installing Command....${NC}
sleep 2
clear
echo -e "[ ${r}INFO${NC} ] = ${g}Installing Module For Bot, Please Waiting...${NC}"
sleep 2.5
cd /etc/jvo-script/
wget https://raw.githubusercontent.com/yuiluchanvpn/v3/main/bot/jvo-module.zip
unzip jvo-module.zip
pip3 install -r jvo/requirements.txt
rm -rf jvo-module.zip
clear
echo -e "${g}Done Installing Module....${NC}"
sleep 2
clear
echo ""
figlet 'JVO TEAM' | lolcat
echo -e "$u ┌────────────────────────────────────────────────┐${NC}"
echo -e "$u │ \e[1;97;101m                ADD BOT PANEL                 ${NC} ${u}│${NC}"
echo -e "$u └────────────────────────────────────────────────┘${NC}"
echo -e "$u ┌────────────────────────────────────────────────┐${NC}"
echo -e "$u │ ${g}Tutorial Create Bot and ID Telegram                   ${NC}"
echo -e "$u │ ${g}Create Bot and Token Bot : @BotFather                 ${NC}"
echo -e "$u │ ${g}Info Id Telegram : @MissRose_bot perintah /info      ${NC}"
echo -e "$u └────────────────────────────────────────────────┘${NC}"
echo -e ""
read -e -p "  [ NOTE ] Input Your Bot Token : " bottoken
sleep 0.5
read -e -p "  [ NOTE ] Input Your Id Telegram : " admin
echo -e BOT_TOKEN='"'$bottoken'"' >> /etc/jvo-script/jvo/var.txt
echo -e ADMIN='"'$admin'"' >> /etc/jvo-script/jvo/var.txt
echo -e DOMAIN='"'$domain'"' >> /etc/jvo-script/jvo/var.txt
echo -e PUB='"'$PUB'"' >> /etc/jvo-script/jvo/var.txt
echo -e HOST='"'$NS'"' >> /etc/jvo-script/jvo/var.txt
clear

if [ -e /etc/systemd/system/bot-jvo.service ]; then
echo ""
else
rm -fr /etc/systemd/system/bot-jvo.service
fi

cat > /etc/systemd/system/bot-jvo.service << END
[Unit]
Description=Simple Bot Tele By - @FernandaIrfan
After=network.target

[Service]
WorkingDirectory=/etc/jvo-script
ExecStart=/etc/jvo-script/python3 -m jvo
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl start bot-jvo
systemctl enable bot-jvo
systemctl restart bot-jvo
cd
sleep 0.5
echo -e "
${g}Setup BOT-JVO Completed${NC}
"
sleep 1
# // STATUS SERVICE BOT
bot_service=$(systemctl status bot-jvo | grep active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $bot_service == "running" ]]; then 
   sts_bot="${g}RUNNING [ OK ]${NC}"
else
   sts_bot="${r}DEAD [ ERROR ]${NC}"
fi
rm -rf /etc/jvo-script/*.zip
clear
neofetch
echo -e "  ${y} Your Data BOT Info${NC}"
echo -e "  ${u}┌───────────────────────────────────┐${NC}"
echo -e "  ${u}│$r Status BOT ${y}=$NC $sts_bot "
echo -e "  ${u}│$r Token BOT  ${y}=$NC $bottoken "
echo -e "  ${u}│$r Admin ID   ${y}=$NC $admin "
echo -e "  ${u}│$r Domain     ${y}=$NC $domain "
#echo -e "  ${u}│$r NS Domain  ${y}=$NC $NS "
echo -e "  ${u}└───────────────────────────────────┘${NC}"
echo -e ""
history -c
read -p "  Press [ Enter ] to back on menu"
menu
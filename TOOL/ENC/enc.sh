#!/bin/bash
BL='\e[1;36m'
NC='\e[0m'
clear

echo ""
echo -e " ${BL}[01]${NC} • ENCRYPT"
echo -e " ${BL}[00]${NC} • EXIT"
echo -e "${BL}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
01 | 1) clear ; shco ;;
00 | 0) clear ; menu ;;
*) clear ; enc ;;
esac

#!/bin/bash

# darkboss1bd IP Changer Tool
# Author: darkboss1bd
# Telegram: https://t.me/darkvaiadmin
# Website: https://serialkey.top/

# Colors for design
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Hacker animation function
hacker_animation() {
    local animation=('/' '-' '\' '|')
    for i in {1..10}; do
        for frame in "${animation[@]}"; do
            echo -ne "${CYAN}Hacking IP changer... $frame\r${NC}"
            sleep 0.1
        done
    done
    echo -ne "\r${GREEN}IP changer ready!          ${NC}\n"
}

# Banner function
print_banner() {
    clear
    echo -e "${RED}==============================================${NC}"
    echo -e "${YELLOW}      ██████╗  █████╗ ██████╗ ██████╗ ███████╗${NC}"
    echo -e "${YELLOW}     ██╔════╝ ██╔══██╗██╔══██╗██╔══██╗██╔════╝${NC}"
    echo -e "${YELLOW}     ██║  ███╗███████║██████╔╝██████╔╝█████╗  ${NC}"
    echo -e "${YELLOW}     ██║   ██║██╔══██║██╔═══╝ ██╔═══╝ ██╔══╝  ${NC}"
    echo -e "${YELLOW}     ╚██████╔╝██║  ██║██║     ██║     ███████╗${NC}"
    echo -e "${YELLOW}      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝     ╚══════╝${NC}"
    echo -e "${CYAN}               IP Changer Tool v1.0${NC}"
    echo -e "${CYAN}                 by darkboss1bd${NC}"
    echo -e "${RED}==============================================${NC}"
    echo
}

# Function to change IP address
change_ip() {
    echo -e "${YELLOW}Enter the network interface (e.g., eth0, wlan0):${NC}"
    read -r interface
    echo -e "${YELLOW}Enter the new IP address (e.g., 192.168.1.100):${NC}"
    read -r new_ip
    echo -e "${YELLOW}Enter the subnet mask (e.g., 255.255.255.0):${NC}"
    read -r subnet_mask
    echo -e "${YELLOW}Enter the gateway IP (e.g., 192.168.1.1):${NC}"
    read -r gateway

    echo -e "${CYAN}Applying new IP settings...${NC}"
    sudo ifconfig "$interface" "$new_ip" netmask "$subnet_mask"
    sudo route add default gw "$gateway" "$interface"

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}IP address changed successfully!${NC}"
    else
        echo -e "${RED}Failed to change IP address. Please check your inputs and try again.${NC}"
    fi
}

# Main program
print_banner
hacker_animation

while true; do
    echo -e "${CYAN}Choose an option:${NC}"
    echo "1) Change IP address"
    echo "2) Show current IP configuration"
    echo "3) Exit"
    echo -n "Enter your choice [1-3]: "
    read -r choice

    case $choice in
        1)
            change_ip
            ;;
        2)
            echo -e "${CYAN}Current IP configuration:${NC}"
            ifconfig
            ;;
        3)
            echo -e "${GREEN}Exiting... Goodbye!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option! Please choose 1, 2, or 3.${NC}"
            ;;
    esac
    echo
done
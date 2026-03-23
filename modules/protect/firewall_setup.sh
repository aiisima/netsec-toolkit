#!/usr/bin/env bash

setup_firewall() {
    echo -e "${BLUE}[*] Setting up basic firewall rules...${NC}"
    
    # Check if running as root
    if [[ $EUID -ne 0 ]]; then
        echo -e "${RED}[!] Root required for firewall${NC}"
        return
    fi
    
    # Basic rules for Termux
    iptables -P INPUT DROP
    iptables -P FORWARD DROP
    iptables -P OUTPUT ACCEPT
    
    iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
    iptables -A INPUT -i lo -j ACCEPT
    
    echo -e "${GREEN}[+] Firewall rules applied${NC}"
    log_info "Firewall configured"
    pause
}

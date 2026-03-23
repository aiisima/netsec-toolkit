#!/usr/bin/env bash

packet_analyzer() {
    echo -ne "${CYAN}[+] Interface (wlan0): ${NC}"
    read interface
    [[ -z "$interface" ]] && interface="wlan0"
    
    echo -ne "${CYAN}[+] Number of packets: ${NC}"
    read count
    [[ -z "$count" ]] && count=50
    
    echo -e "${BLUE}[*] Analyzing $count packets...${NC}"
    sudo tcpdump -i "$interface" -c "$count" -n 2>/dev/null
    
    log_info "Packet analysis on $interface"
    pause
}

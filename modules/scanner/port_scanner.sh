#!/usr/bin/env bash

port_scan() {
    echo -ne "${CYAN}[+] Target IP address: ${NC}"
    read target_ip
    
    if [[ -z "$target_ip" ]]; then
        echo -e "${RED}[!] No IP provided${NC}"
        return
    fi
    
    echo -e "${BLUE}[*] Scanning ports on $target_ip...${NC}"
    nmap -sS -p 1-1024 "$target_ip" -T4
    
    log_info "Port scan completed on $target_ip"
    pause
}

#!/usr/bin/env bash

scan_network() {
    echo -e "${BLUE}[*] Scanning network $LOCAL_SUBNET...${NC}"
    echo -e "${YELLOW}[*] This may take a moment${NC}"
    echo ""
    
    nmap -sn "$LOCAL_SUBNET" -oG - 2>/dev/null | grep "Up" | awk '{print $2, $3, $4, $5}'
    
    log_info "Network scan completed"
    pause
}

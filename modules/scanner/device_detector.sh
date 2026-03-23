#!/usr/bin/env bash

detect_devices() {
    echo -e "${BLUE}[*] Detecting all active devices...${NC}"
    echo ""
    
    echo -e "${GREEN}IP Address        | MAC Address        | Vendor${NC}"
    echo -e "${GREEN}------------------+--------------------+------------------${NC}"
    
    arp -a | awk '{printf "%-18s | %-18s | %s\n", $2, $4, $1}' | sed 's/[()]//g'
    
    log_info "Device detection completed"
    pause
}

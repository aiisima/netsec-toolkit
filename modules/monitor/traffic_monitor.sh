#!/usr/bin/env bash

traffic_monitor() {
    echo -e "${BLUE}[*] Monitoring traffic on all interfaces...${NC}"
    echo -e "${YELLOW}[*] Press Ctrl+C to stop${NC}"
    echo ""
    
    sudo tcpdump -i any -n -c 100 2>/dev/null
    
    log_info "Traffic capture completed"
    pause
}

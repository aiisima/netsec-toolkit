#!/usr/bin/env bash

detect_deauth() {
    echo -e "${BLUE}[*] Listening for deauth attacks...${NC}"
    echo -e "${YELLOW}[*] Press Ctrl+C to stop${NC}"
    
    # Monitor for deauth packets (management frames)
    sudo tcpdump -i wlan0 -n "wlan type mgt subtype deauth" 2>/dev/null
    
    log_info "Deauth detection completed"
    pause
}

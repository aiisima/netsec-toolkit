#!/usr/bin/env bash

ping_monitor() {
    echo -ne "${CYAN}[+] Target IP/Host: ${NC}"
    read target
    [[ -z "$target" ]] && target="8.8.8.8"
    
    echo -e "${BLUE}[*] Pinging $target continuously...${NC}"
    echo -e "${YELLOW}[*] Press Ctrl+C to stop${NC}"
    echo ""
    
    ping "$target"
    
    log_info "Ping monitor stopped"
    pause
}

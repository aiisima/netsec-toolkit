#!/usr/bin/env bash

intrusion_detect() {
    echo -e "${BLUE}[*] Checking for suspicious activity...${NC}"
    
    # Check for failed login attempts
    echo -e "${YELLOW}Failed SSH attempts:${NC}"
    grep "Failed password" /data/data/com.termux/files/usr/var/log/auth.log 2>/dev/null | tail -5 || echo "  No logs found"
    
    # Check for unusual connections
    echo -e "${YELLOW}Established connections:${NC}"
    netstat -an | grep ESTABLISHED | head -5
    
    log_info "Intrusion detection check completed"
    pause
}

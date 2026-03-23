#!/usr/bin/env bash

speed_test() {
    echo -e "${BLUE}[*] Testing internet speed...${NC}"
    echo -e "${YELLOW}[*] This may take a moment${NC}"
    
    # Simple ping test
    echo -ne "${GREEN}Latency: ${NC}"
    ping -c 3 google.com 2>/dev/null | grep "avg" | awk -F'/' '{print $5 " ms"}' || echo "Failed"
    
    # Download test (small file)
    echo -ne "${GREEN}Download speed: ${NC}"
    curl -s -o /dev/null -w "%{speed_download} bytes/sec\n" http://speedtest.tele2.net/1MB.zip 2>/dev/null || echo "Failed"
    
    log_info "Speed test completed"
    pause
}

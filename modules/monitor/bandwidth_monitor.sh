#!/usr/bin/env bash

bandwidth_monitor() {
    echo -e "${BLUE}[*] Bandwidth Monitor (10 seconds)...${NC}"
    
    # Get initial counters
    rx1=$(cat /sys/class/net/wlan0/statistics/rx_bytes 2>/dev/null || echo 0)
    tx1=$(cat /sys/class/net/wlan0/statistics/tx_bytes 2>/dev/null || echo 0)
    
    sleep 10
    
    rx2=$(cat /sys/class/net/wlan0/statistics/rx_bytes 2>/dev/null || echo 0)
    tx2=$(cat /sys/class/net/wlan0/statistics/tx_bytes 2>/dev/null || echo 0)
    
    rx_diff=$((rx2 - rx1))
    tx_diff=$((tx2 - tx1))
    
    echo -e "${GREEN}Download: $(echo "scale=2; $rx_diff / 1024 / 10" | bc) KB/s${NC}"
    echo -e "${GREEN}Upload:   $(echo "scale=2; $tx_diff / 1024 / 10" | bc) KB/s${NC}"
    
    log_info "Bandwidth check completed"
    pause
}

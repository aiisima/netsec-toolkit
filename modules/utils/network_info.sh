#!/usr/bin/env bash

show_network_info() {
    echo -e "${CYAN}=== Network Information ===${NC}"
    echo ""
    echo -e "${GREEN}IP Address:$(get_local_ip)${NC}"
    echo -e "${GREEN}Hostname: $(get_device_name)${NC}"
    echo -e "${GREEN}Gateway: $(ip route | grep default | awk '{print $3}')${NC}"
    echo ""
    echo -e "${YELLOW}Interfaces:${NC}"
    ip addr show | grep -E "^[0-9]|inet "
    echo ""
    echo -e "${YELLOW}WiFi Info:${NC}"
    iwconfig 2>/dev/null | grep -E "ESSID|Signal|Bit Rate"
    
    pause
}

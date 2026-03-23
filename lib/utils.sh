#!/usr/bin/env bash

get_local_ip() {
    ip route get 1 2>/dev/null | awk '{print $NF; exit}' || echo "127.0.0.1"
}

get_device_name() {
    uname -n 2>/dev/null || echo "unknown"
}

pause() {
    echo -ne "${GRAY}[Press Enter to continue...]${NC}"
    read
}

confirm() {
    echo -ne "${YELLOW}[?] $1 (y/n): ${NC}"
    read answer
    [[ "$answer" == "y" || "$answer" == "Y" ]]
}

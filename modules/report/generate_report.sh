#!/usr/bin/env bash

generate_report() {
    local report_file="$PROJECT_DIR/reports/report_$(date +%Y%m%d_%H%M%S).txt"
    
    echo -e "${BLUE}[*] Generating security report...${NC}"
    
    {
        echo "=========================================="
        echo "Network Security Report"
        echo "Date: $(date)"
        echo "Device: $(get_device_name)"
        echo "IP: $(get_local_ip)"
        echo "=========================================="
        echo ""
        echo "--- Active Devices ---"
        arp -a
        echo ""
        echo "--- Network Interfaces ---"
        ip addr show
        echo ""
        echo "--- Open Ports (Local) ---"
        netstat -tln 2>/dev/null | head -10
    } > "$report_file"
    
    echo -e "${GREEN}[+] Report saved: $report_file${NC}"
    log_info "Report generated: $report_file"
    pause
}

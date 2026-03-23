#!/usr/bin/env bash

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$PROJECT_DIR/lib/colors.sh"
source "$PROJECT_DIR/lib/utils.sh"
source "$PROJECT_DIR/lib/logger.sh"
source "$PROJECT_DIR/config/settings.conf"

# Load modules
source "$PROJECT_DIR/modules/scanner/network_scanner.sh"
source "$PROJECT_DIR/modules/scanner/device_detector.sh"
source "$PROJECT_DIR/modules/scanner/port_scanner.sh"
source "$PROJECT_DIR/modules/monitor/traffic_monitor.sh"
source "$PROJECT_DIR/modules/monitor/bandwidth_monitor.sh"
source "$PROJECT_DIR/modules/monitor/packet_analyzer.sh"
source "$PROJECT_DIR/modules/protect/firewall_setup.sh"
source "$PROJECT_DIR/modules/protect/intrusion_detect.sh"
source "$PROJECT_DIR/modules/protect/deauth_detector.sh"
source "$PROJECT_DIR/modules/report/generate_report.sh"
source "$PROJECT_DIR/modules/utils/network_info.sh"
source "$PROJECT_DIR/modules/utils/speed_test.sh"
source "$PROJECT_DIR/modules/utils/ping_monitor.sh"

show_banner() {
    clear
    echo -e "${BLUE}"
    cat << "EOF"
╔═══════════════════════════════════════════════════════════════════════╗
║   ███╗   ██╗███████╗████████╗███████╗ ██████╗                     ║
║   ████╗  ██║██╔════╝╚══██╔══╝██╔════╝██╔════╝                     ║
║   ██╔██╗ ██║█████╗     ██║   ███████╗██║                          ║
║   ██║╚██╗██║██╔══╝     ██║   ╚════██║██║                          ║
║   ██║ ╚████║███████╗   ██║   ███████║╚██████╗                     ║
║   ╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚══════╝ ╚═════╝                     ║
║                                                                       ║
║              ████████╗ ██████╗  ██████╗ ██╗██╗  ██╗██╗████████╗     ║
║              ╚══██╔══╝██╔═══██╗██╔═══██╗██║██║ ██╔╝██║╚══██╔══╝     ║
║                 ██║   ██║   ██║██║   ██║██║█████╔╝ ██║   ██║        ║
║                 ██║   ██║   ██║██║   ██║██║██╔═██╗ ██║   ██║        ║
║                 ██║   ╚██████╔╝╚██████╔╝██║██║  ██╗██║   ██║        ║
║                 ╚═╝    ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═╝╚═╝   ╚═╝        ║
║                                                                       ║
║                     v1.0 - AIISIMA                      ║
║              YouTube : https://www.youtube.com/@aiisima                    ║
╚═══════════════════════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
    echo -e "${GREEN}[+] Device: $(get_device_name) | IP: $(get_local_ip)${NC}"
    echo -e "${YELLOW}[+] Session: $(date '+%Y-%m-%d %H:%M:%S')${NC}"
    echo ""
}

show_menu() {
    echo -e "${WHITE}┌─────────────────────────────────────────────────────────────────┐${NC}"
    echo -e "${WHITE}│  ${GREEN}1.${NC} Scan Network (Your Devices)     ${GREEN}6.${NC} Speed Test                       ${WHITE}│${NC}"
    echo -e "${WHITE}│  ${GREEN}2.${NC} Detect All Devices              ${GREEN}7.${NC} Deauth Attack Detector            ${WHITE}│${NC}"
    echo -e "${WHITE}│  ${GREEN}3.${NC} Port Scanner                    ${GREEN}8.${NC} Firewall Setup                   ${WHITE}│${NC}"
    echo -e "${WHITE}│  ${GREEN}4.${NC} Traffic Monitor                 ${GREEN}9.${NC} Intrusion Detection              ${WHITE}│${NC}"
    echo -e "${WHITE}│  ${GREEN}5.${NC} Bandwidth Monitor               ${GREEN}10.${NC} Generate Report                  ${WHITE}│${NC}"
    echo -e "${WHITE}├─────────────────────────────────────────────────────────────────┤${NC}"
    echo -e "${WHITE}│  ${YELLOW}11.${NC} Network Info        ${YELLOW}12.${NC} Ping Monitor     ${YELLOW}13.${NC} View Logs    ${WHITE}│${NC}"
    echo -e "${WHITE}│  ${RED}0.${NC} Exit                                                           ${WHITE}│${NC}"
    echo -e "${WHITE}└─────────────────────────────────────────────────────────────────┘${NC}"
    echo -ne "${CYAN}[+] Select option: ${NC}"
}

main() {
    while true; do
        show_banner
        show_menu
        read choice
        
        case $choice in
            1) scan_network ;;
            2) detect_devices ;;
            3) port_scan ;;
            4) traffic_monitor ;;
            5) bandwidth_monitor ;;
            6) speed_test ;;
            7) detect_deauth ;;
            8) setup_firewall ;;
            9) intrusion_detect ;;
            10) generate_report ;;
            11) show_network_info ;;
            12) ping_monitor ;;
            13) view_logs ;;
            0) echo -e "${GREEN}[+] Exiting...${NC}"; exit 0 ;;
            *) echo -e "${RED}[!] Invalid option${NC}"; sleep 1 ;;
        esac
    done
}

main

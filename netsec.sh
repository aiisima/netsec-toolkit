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
               _   _  ____  _____  ___   ___             
              ( \ ( )(  __)(_   _)/  _) (  _)            
              | \\| || |_    | |  \_"-. | |              
              ( )\\ )(  _)   ( )   __) )( )_             
              /_\ \_\/____\  /_\  /___/ /___\ v1.0           
                                                         
                     _____  __    __   _  _     _  _____ 
                    (_   _)(  )  (  ) ( )( ) __( )(_   _)
                      | |  /  \  /  \ | || |/ /| |  | |  
                      ( ) ( O  )( O  )( )( _ ( ( )  ( )  
                      /_\  \__/  \__/ /_\/_\\_|/_\  /_\  
         YouTube :
 https://www.youtube.com/@aiisima
         Telegram :
     t.me/AiiSimaRajaIblis 
EOF
    echo -e "${NC}"
    echo ""
    echo -e "${GREEN}  Device: $(get_device_name)${NC}"
    echo -e "${GREEN}  IP: $(get_local_ip)${NC}"
    echo -e "${YELLOW}  Session: $(date '+%Y-%m-%d %H:%M:%S')${NC}"
    echo ""
}

show_menu() {
    echo -e "${CYAN}┌────────────────────────────────────────────────────────────────────┐${NC}"
    echo -e "${CYAN}│                        NETWORK TOOLKIT MENU                        │${NC}"
    echo -e "${CYAN}├────────────────────────────────────────────────────────────────────┤${NC}"
    echo -e "${CYAN}│  ${GREEN}1.${NC} Scan Network                ${GREEN}6.${NC} Speed Test                        ${CYAN}│${NC}"
    echo -e "${CYAN}│  ${GREEN}2.${NC} Detect All Devices          ${GREEN}7.${NC} Deauth Detector                   ${CYAN}│${NC}"
    echo -e "${CYAN}│  ${GREEN}3.${NC} Port Scanner                ${GREEN}8.${NC} Firewall Setup                    ${CYAN}│${NC}"
    echo -e "${CYAN}│  ${GREEN}4.${NC} Traffic Monitor             ${GREEN}9.${NC} Intrusion Detection               ${CYAN}│${NC}"
    echo -e "${CYAN}│  ${GREEN}5.${NC} Bandwidth Monitor           ${GREEN}10.${NC} Generate Report                   ${CYAN}│${NC}"
    echo -e "${CYAN}├────────────────────────────────────────────────────────────────────┤${NC}"
    echo -e "${CYAN}│  ${YELLOW}11.${NC} Network Info          ${YELLOW}12.${NC} Ping Monitor          ${YELLOW}13.${NC} View Logs      ${CYAN}│${NC}"
    echo -e "${CYAN}├────────────────────────────────────────────────────────────────────┤${NC}"
    echo -e "${CYAN}│  ${RED}0.${NC} Exit                                                           ${CYAN}│${NC}"
    echo -e "${CYAN}└────────────────────────────────────────────────────────────────────┘${NC}"
    echo ""
    echo -ne "${WHITE}➜ Select option: ${NC}"
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
            0) 
                echo ""
                echo -e "${GREEN}┌────────────────────────────────────────────────────────────────────┐${NC}"
                echo -e "${GREEN}│  Thank you for using Network Security Toolkit!                    │${NC}"
                echo -e "${GREEN}│  Goodbye!                                                          │${NC}"
                echo -e "${GREEN}└────────────────────────────────────────────────────────────────────┘${NC}"
                exit 0 
                ;;
            *) 
                echo ""
                echo -e "${RED}┌────────────────────────────────────────────────────────────────────┐${NC}"
                echo -e "${RED}│  Invalid option! Please choose 0-13                                │${NC}"
                echo -e "${RED}└────────────────────────────────────────────────────────────────────┘${NC}"
                sleep 1 
                ;;
        esac
    done
}

main

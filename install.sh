#!/usr/bin/env bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

# Animasi loading
loading_animation() {
    local pid=$1
    local delay=0.1
    local spinstr='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    
    while ps -p $pid > /dev/null 2>&1; do
        for ((i=0; i<${#spinstr}; i++)); do
            echo -ne "${CYAN}\r  [${spinstr:$i:1}] $2${NC}"
            sleep $delay
        done
    done
    echo -ne "\r${GREEN}  ✓ $2${NC}\n"
}

# Animasi progress bar
progress_bar() {
    local duration=$1
    local message=$2
    local width=50
    local percent=0
    
    echo -ne "${CYAN}  $message [${NC}"
    for ((i=0; i<=width; i++)); do
        echo -ne "${CYAN}░${NC}"
    done
    echo -ne "${CYAN}] 0%%${NC}\r"
    
    for ((i=0; i<=width; i++)); do
        sleep $(echo "$duration / $width" | bc -l 2>/dev/null || echo "0.02")
        percent=$((i * 100 / width))
        echo -ne "${CYAN}  $message [${NC}"
        for ((j=0; j<i; j++)); do
            echo -ne "${GREEN}█${NC}"
        done
        for ((j=i; j<width; j++)); do
            echo -ne "${CYAN}░${NC}"
        done
        echo -ne "${CYAN}] ${percent}%%\r${NC}"
    done
    echo ""
}

echo -e "${BLUE}┌──────────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${BLUE}│          Network Security Toolkit v1.0 - Installation               │${NC}"
echo -e "${BLUE}└──────────────────────────────────────────────────────────────────────┘${NC}"
echo ""

PROJECT_DIR="$HOME/netsec-toolkit"
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

# Step 1: Create directory structure
echo -e "${GREEN}┌──────────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}│  [1/4] Creating directory structure...                              │${NC}"
echo -e "${GREEN}└──────────────────────────────────────────────────────────────────────┘${NC}"
(
    mkdir -p config modules/{scanner,monitor,protect,report,utils} lib logs reports temp docs
) &
loading_animation $! "Creating directories"
sleep 0.5
echo ""

# Step 2: Install dependencies with progress bar
echo -e "${GREEN}┌──────────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}│  [2/4] Installing dependencies...                                   │${NC}"
echo -e "${GREEN}└──────────────────────────────────────────────────────────────────────┘${NC}"

echo -e "${CYAN}  Updating package list...${NC}"
(
    pkg update -y > /dev/null 2>&1
) &
loading_animation $! "Updating packages"

echo -e "${CYAN}  Installing system packages...${NC}"
(
    pkg install -y python nmap curl wget bc jq termux-api > /dev/null 2>&1
) &
loading_animation $! "Installing system packages"

echo -e "${CYAN}  Installing Python packages...${NC}"
(
    pip install scapy > /dev/null 2>&1
) &
loading_animation $! "Installing Python packages"

echo -e "${GREEN}  ✓ All packages installed successfully${NC}"
echo ""

# Step 3: Set permissions with animation
echo -e "${GREEN}┌──────────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}│  [3/4] Setting permissions...                                       │${NC}"
echo -e "${GREEN}└──────────────────────────────────────────────────────────────────────┘${NC}"

echo -e "${CYAN}  Configuring file permissions...${NC}"
progress_bar 1.5 "Setting permissions"
chmod +x *.sh 2>/dev/null || true
chmod +x modules/*/*.sh 2>/dev/null || true
chmod +x lib/*.sh 2>/dev/null || true
echo -e "${GREEN}  ✓ Permissions configured${NC}"
echo ""

# Step 4: Installation complete with celebration effect
echo -e "${GREEN}┌──────────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}│  [4/4] Finalizing installation...                                   │${NC}"
echo -e "${GREEN}└──────────────────────────────────────────────────────────────────────┘${NC}"

echo -e "${CYAN}  Verifying installation...${NC}"
progress_bar 1 "Verifying files"
echo ""

# Celebration animation
echo -ne "${YELLOW}"
for i in {1..3}; do
    echo -ne "✨  Installation Complete!  ✨\r"
    sleep 0.3
    echo -ne "   Installation Complete!   \r"
    sleep 0.3
done
echo -e "${NC}"

echo -e "${GREEN}┌──────────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}│  Installation Complete!                                             │${NC}"
echo -e "${GREEN}└──────────────────────────────────────────────────────────────────────┘${NC}"
echo ""
echo -e "${YELLOW}┌──────────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${YELLOW}│  Next Steps:                                                         │${NC}"
echo -e "${YELLOW}│                                                                      │${NC}"
echo -e "${YELLOW}│    ${GREEN}cd ~/netsec-toolkit${YELLOW}                                               │${NC}"
echo -e "${YELLOW}│    ${GREEN}./netsec.sh${YELLOW}                                                       │${NC}"
echo -e "${YELLOW}│                                                                      │${NC}"
echo -e "${YELLOW}│  ${CYAN}YouTube: https://www.youtube.com/@aiisima${YELLOW}                              │${NC}"
echo -e "${YELLOW}│  ${CYAN}Telegram: t.me/AiiSimaRajaIblis${YELLOW}                                        │${NC}"
echo -e "${YELLOW}└──────────────────────────────────────────────────────────────────────┘${NC}"
echo ""
echo -e "${BLUE}[+] Installation completed successfully! Get ready to secure your network${NC}"

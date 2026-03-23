#!/usr/bin/env bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}┌──────────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${BLUE}│          Network Security Toolkit v1.0 - Installation               │${NC}"
echo -e "${BLUE}└──────────────────────────────────────────────────────────────────────┘${NC}"
echo ""

PROJECT_DIR="$HOME/netsec-toolkit"
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

echo -e "${GREEN}┌──────────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}│  [1/4] Creating directory structure...                              │${NC}"
echo -e "${GREEN}└──────────────────────────────────────────────────────────────────────┘${NC}"
mkdir -p config modules/{scanner,monitor,protect,report,utils} lib logs reports temp docs
echo -e "${GREEN}  ✓ Directory structure created${NC}"
echo ""

echo -e "${GREEN}┌──────────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}│  [2/4] Installing dependencies...                                   │${NC}"
echo -e "${GREEN}└──────────────────────────────────────────────────────────────────────┘${NC}"
pkg update -y > /dev/null 2>&1
pkg install -y python nmap curl wget bc jq termux-api > /dev/null 2>&1
echo -e "${GREEN}  ✓ System packages installed${NC}"

pip install scapy > /dev/null 2>&1
echo -e "${GREEN}  ✓ Python packages installed${NC}"
echo ""

echo -e "${GREEN}┌──────────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}│  [3/4] Setting permissions...                                       │${NC}"
echo -e "${GREEN}└──────────────────────────────────────────────────────────────────────┘${NC}"
chmod +x *.sh 2>/dev/null || true
chmod +x modules/*/*.sh 2>/dev/null || true
chmod +x lib/*.sh 2>/dev/null || true
echo -e "${GREEN}  ✓ Permissions configured${NC}"
echo ""

echo -e "${GREEN}┌──────────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}│  [4/4] Installation Complete!                                       │${NC}"
echo -e "${GREEN}└──────────────────────────────────────────────────────────────────────┘${NC}"
echo ""
echo -e "${YELLOW}┌──────────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${YELLOW}│  Next Steps:                                                         │${NC}"
echo -e "${YELLOW}│                                                                      │${NC}"
echo -e "${YELLOW}│    cd ~/netsec-toolkit                                               │${NC}"
echo -e "${YELLOW}│    ./netsec.sh                                                       │${NC}"
echo -e "${YELLOW}│                                                                      │${NC}"
echo -e "${YELLOW}└──────────────────────────────────────────────────────────────────────┘${NC}"
echo ""
echo -e "${BLUE}[+] Installation completed successfully!${NC}"

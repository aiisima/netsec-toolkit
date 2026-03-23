#!/usr/bin/env bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     Network Security Toolkit v1.0 - Installation           ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════════╝${NC}"

PROJECT_DIR="$HOME/netsec-toolkit"
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

echo -e "${GREEN}[+] Creating directory structure...${NC}"
mkdir -p config modules/{scanner,monitor,protect,report,utils} lib logs reports temp docs

echo -e "${GREEN}[+] Installing dependencies...${NC}"
pkg update -y
pkg install -y python nmap curl wget bc jq termux-api

pip install scapy

echo -e "${GREEN}[+] Setting permissions...${NC}"
chmod +x *.sh 2>/dev/null || true
chmod +x modules/*/*.sh 2>/dev/null || true
chmod +x lib/*.sh 2>/dev/null || true

echo -e "${GREEN}[+] Installation complete!${NC}"
echo -e "${YELLOW}[*] Run: cd ~/netsec-toolkit && ./netsec.sh${NC}"

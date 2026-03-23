#!/usr/bin/env bash

LOG_DIR="$PROJECT_DIR/logs"
MAIN_LOG="$LOG_DIR/activity.log"

log_info() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] INFO: $1" >> "$MAIN_LOG"
}

log_warn() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] WARN: $1" >> "$MAIN_LOG"
}

log_error() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: $1" >> "$MAIN_LOG"
}

view_logs() {
    echo -e "${CYAN}=== Recent Activity ===${NC}"
    tail -30 "$MAIN_LOG" 2>/dev/null || echo "No logs found"
    pause
}

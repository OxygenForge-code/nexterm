#!/bin/bash
# Disk information module for Nexterm

source "${SCRIPT_DIR}/core/colors.sh"
source "${SCRIPT_DIR}/core/logger.sh"

show_disk_info() {
    log_info "Gathering disk information..."
    
    echo ""
    highlight "=== Disk Information ==="
    echo ""
    
    # Display disk usage with df command
    df -h / | awk 'NR==2 {
        printf "Filesystem: %s\n", $1
        printf "Total:      %s\n", $2
        printf "Used:       %s\n", $3
        printf "Available:  %s\n", $4
        printf "Usage:      %s\n", $5
    }'
    
    echo ""
    highlight "Mounted Filesystems:"
    echo ""
    df -h | awk 'NR>1 {printf "  %-20s %10s %10s %10s %5s\n", $1, $2, $3, $4, $5}'
    
    echo ""
}
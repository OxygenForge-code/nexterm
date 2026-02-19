#!/bin/bash
# RAM information module for Nexterm

source "${SCRIPT_DIR}/core/colors.sh"
source "${SCRIPT_DIR}/core/logger.sh"

show_ram_info() {
    log_info "Gathering RAM information..."
    
    echo ""
    highlight "=== RAM Information ==="
    echo ""
    
    # Get memory information from /proc/meminfo
    local mem_total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    local mem_available=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
    local mem_used=$((mem_total - mem_available))
    
    # Convert to human-readable format
    local total_gb=$(echo "scale=2; $mem_total / 1024 / 1024" | bc)
    local used_gb=$(echo "scale=2; $mem_used / 1024 / 1024" | bc)
    local available_gb=$(echo "scale=2; $mem_available / 1024 / 1024" | bc)
    
    # Calculate percentage
    local percent=$((mem_used * 100 / mem_total))
    
    echo "$(highlight 'Total:') ${total_gb} GB"
    echo "$(highlight 'Used:') ${used_gb} GB"
    echo "$(highlight 'Available:') ${available_gb} GB"
    echo "$(highlight 'Usage:') ${percent}%"
    
    echo ""
}
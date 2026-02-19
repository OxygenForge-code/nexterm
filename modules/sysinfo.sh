#!/bin/bash
# System information module for Nexterm

source "${SCRIPT_DIR}/core/colors.sh"
source "${SCRIPT_DIR}/core/logger.sh"

show_sysinfo() {
    log_info "Gathering system information..."
    
    echo ""
    highlight "=== System Information ==="
    echo ""
    
    # Hostname
    echo "$(highlight 'Hostname:') $(hostname)"
    
    # OS
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "$(highlight 'OS:') $PRETTY_NAME"
    fi
    
    # Kernel
    echo "$(highlight 'Kernel:') $(uname -r)"
    
    # Uptime
    echo "$(highlight 'Uptime:') $(uptime -p)"
    
    echo ""
}
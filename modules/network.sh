#!/bin/bash
# Network information module for Nexterm

source "${SCRIPT_DIR}/core/colors.sh"
source "${SCRIPT_DIR}/core/logger.sh"

show_network_info() {
    log_info "Gathering network information..."
    
    echo ""
    highlight "=== Network Information ==="
    echo ""
    
    # Get IP address
    local ip_address=$(hostname -I | awk '{print $1}')
    echo "$(highlight 'Local IP:') $ip_address"
    
    # Get gateway
    local gateway=$(ip route | grep default | awk '{print $3}')
    echo "$(highlight 'Gateway:') $gateway"
    
    # Get DNS
    local dns=$(grep nameserver /etc/resolv.conf | awk '{print $2}' | head -1)
    echo "$(highlight 'DNS:') $dns"
    
    echo ""
    highlight "Network Interfaces:"
    echo ""
    
    # List all interfaces
    ip link show | grep "^[0-9]" | awk -F: '{print "  " $2}' | sed 's/^[[:space:]]*//'
    
    echo ""
}
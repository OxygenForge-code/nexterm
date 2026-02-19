#!/bin/bash
# CPU information module for Nexterm

source "${SCRIPT_DIR}/core/colors.sh"
source "${SCRIPT_DIR}/core/logger.sh"

show_cpu_info() {
    log_info "Gathering CPU information..."
    
    echo ""
    highlight "=== CPU Information ==="
    echo ""
    
    # CPU Model
    local cpu_model=$(grep "model name" /proc/cpuinfo | head -1 | cut -d: -f2 | xargs)
    echo "
$(highlight 'Model:') $cpu_model"
    
    # CPU Count
    local cpu_count=$(nproc)
    echo "$(highlight 'Cores:') $cpu_count"
    
    # CPU Speed
    local cpu_speed=$(grep "cpu MHz" /proc/cpuinfo | head -1 | cut -d: -f2 | xargs)
    echo "$(highlight 'Speed:') ${cpu_speed} MHz"
    
    # Load Average
    local load=$(cat /proc/loadavg | awk '{print $1, $2, $3}')
    echo "$(highlight 'Load Average:') $load"
    
    echo ""
}
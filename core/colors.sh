#!/bin/bash
# Color definitions and utilities for Nexterm

# ANSI color codes
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly MAGENTA='\033[0;35m'
readonly CYAN='\033[0;36m'
readonly WHITE='\033[1;37m'
readonly GRAY='\033[0;37m'
readonly DARK_GRAY='\033[1;30m'
readonly BOLD='\033[1m'
readonly DIM='\033[2m'
readonly RESET='\033[0m'

# Color output utility
color_text() {
    local color=$1
    local text=$2
    echo -e "${color}${text}${RESET}"
}

# Success message (green)
success() {
    color_text "${GREEN}" "$*"
}

# Error message (red)
error() {
    color_text "${RED}" "$*"
}

# Warning message (yellow)
warning() {
    color_text "${YELLOW}" "$*"
}

# Info message (blue)
info() {
    color_text "${BLUE}" "$*"
}

# Highlight message (cyan)
highlight() {
    color_text "${CYAN}" "$*"
}
#!/bin/bash
# Logging utilities for Nexterm

# Log level constants
readonly LOG_DEBUG=0
readonly LOG_INFO=1
readonly LOG_WARN=2
readonly LOG_ERROR=3

# Get numeric log level
get_log_level() {
    case "${LOG_LEVEL}" in
        DEBUG) echo $LOG_DEBUG ;; 
        INFO) echo $LOG_INFO ;; 
        WARN) echo $LOG_WARN ;; 
        ERROR) echo $LOG_ERROR ;; 
        *) echo $LOG_INFO ;; 
    esac
}

# Log debug message
log_debug() {
    if [ $(get_log_level) -le $LOG_DEBUG ]; then
        echo "[DEBUG] $*" >&2
    fi
}

# Log info message
log_info() {
    if [ $(get_log_level) -le $LOG_INFO ]; then
        echo "[INFO] $*" >&2
    fi
}

# Log warning message
log_warn() {
    if [ $(get_log_level) -le $LOG_WARN ]; then
        echo "[WARN] $*" >&2
    fi
}

# Log error message
log_error() {
    if [ $(get_log_level) -le $LOG_ERROR ]; then
        echo "[ERROR] $*" >&2
    fi
}
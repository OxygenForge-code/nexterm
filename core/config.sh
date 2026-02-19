#!/bin/bash
# Core configuration file for Nexterm

# Application name and version
APP_NAME="Nexterm"
APP_VERSION="1.0.0"

# Script directory
SCRIPT_DIR="$(cd "$(dirname ""${BASH_SOURCE[0]}"")/.." && pwd)"

# Module directories
CORE_DIR="${SCRIPT_DIR}/core"
MODULES_DIR="${SCRIPT_DIR}/modules"
PLUGINS_DIR="${SCRIPT_DIR}/plugins"

# Default configuration
DEBUG_MODE="${DEBUG_MODE:-false}"
VERBOSE_MODE="${VERBOSE_MODE:-false}"

# Log level (DEBUG, INFO, WARN, ERROR)
LOG_LEVEL="${LOG_LEVEL:-INFO}"
#!/bin/bash
# Nexterm Installation Script

set -euo pipefail

INSTALL_DIR="${INSTALL_DIR:-.}"
NEXTERM_DIR="${INSTALL_DIR}/nexterm"

echo "Installing Nexterm..."

# Check if nexterm directory exists
if [ ! -d "${NEXTERM_DIR}" ]; then
    echo "Error: nexterm directory not found at ${NEXTERM_DIR}"
    exit 1
fi

# Make main script executable
if [ -f "${NEXTERM_DIR}/nexterm" ]; then
    chmod +x "${NEXTERM_DIR}/nexterm"
    echo "✓ Made nexterm executable"
fi

# Make all shell scripts in core directory executable
if [ -d "${NEXTERM_DIR}/core" ]; then
    chmod +x "${NEXTERM_DIR}/core"/*.sh 2>/dev/null || true
    echo "✓ Made core scripts executable"
fi

# Make all shell scripts in modules directory executable
if [ -d "${NEXTERM_DIR}/modules" ]; then
    chmod +x "${NEXTERM_DIR}/modules"/*.sh 2>/dev/null || true
    echo "✓ Made module scripts executable"
fi

# Create symlink or add to PATH instructions
echo ""
echo "Installation complete!"
echo "You can now run: ${NEXTERM_DIR}/nexterm [COMMAND]"
echo ""
echo "To add to PATH, run: export PATH=\"${NEXTERM_DIR}:\$PATH\""
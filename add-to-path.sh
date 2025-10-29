#!/bin/bash
# Script to add bin directory to system PATH

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the absolute path to the bin directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BIN_DIR="$SCRIPT_DIR/bin"

# Create bin directory if it doesn't exist
mkdir -p "$BIN_DIR"

echo -e "${YELLOW}Adding bin directory to PATH...${NC}"
echo "Bin directory: $BIN_DIR"
echo ""

# Detect shell configuration file
SHELL_CONFIG=""
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        SHELL_CONFIG="$HOME/.bashrc"
    elif [ -f "$HOME/.bash_profile" ]; then
        SHELL_CONFIG="$HOME/.bash_profile"
    fi
elif [ -n "$ZSH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
fi

if [ -z "$SHELL_CONFIG" ]; then
    # Default to .bashrc if we can't detect
    SHELL_CONFIG="$HOME/.bashrc"
fi

echo "Detected shell config: $SHELL_CONFIG"
echo ""

# Check if already in PATH
if echo "$PATH" | grep -q "$BIN_DIR"; then
    echo -e "${GREEN}✓ Bin directory is already in PATH${NC}"
    exit 0
fi

# Check if export line already exists in config file
EXPORT_LINE="export PATH=\"$BIN_DIR:\$PATH\""
if [ -f "$SHELL_CONFIG" ] && grep -Fxq "$EXPORT_LINE" "$SHELL_CONFIG"; then
    echo -e "${YELLOW}Path export already exists in $SHELL_CONFIG${NC}"
    echo -e "${YELLOW}Please restart your terminal or run: source $SHELL_CONFIG${NC}"
    exit 0
fi

# Add to shell config
echo "" >> "$SHELL_CONFIG"
echo "# Added by cli-tool add-to-path.sh" >> "$SHELL_CONFIG"
echo "$EXPORT_LINE" >> "$SHELL_CONFIG"

echo -e "${GREEN}✓ Added bin directory to PATH in $SHELL_CONFIG${NC}"
echo ""
echo "To apply changes, run one of these commands:"
echo -e "${YELLOW}  source $SHELL_CONFIG${NC}"
echo -e "${YELLOW}  OR restart your terminal${NC}"
echo ""

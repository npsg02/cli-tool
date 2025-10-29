#!/bin/bash
# Script to remove bin directory from system PATH

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the absolute path to the bin directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BIN_DIR="$SCRIPT_DIR/bin"

echo -e "${YELLOW}Removing bin directory from PATH...${NC}"
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

# Check if config file exists
if [ ! -f "$SHELL_CONFIG" ]; then
    echo -e "${YELLOW}No shell configuration file found${NC}"
    exit 0
fi

# Remove the export line and comment
TEMP_FILE=$(mktemp)
grep -v "# Added by cli-tool add-to-path.sh" "$SHELL_CONFIG" | \
grep -v "export PATH=\"$BIN_DIR:\$PATH\"" > "$TEMP_FILE"

# Check if anything was removed
if diff -q "$SHELL_CONFIG" "$TEMP_FILE" > /dev/null; then
    echo -e "${YELLOW}Bin directory was not found in $SHELL_CONFIG${NC}"
    rm "$TEMP_FILE"
else
    mv "$TEMP_FILE" "$SHELL_CONFIG"
    echo -e "${GREEN}✓ Removed bin directory from PATH in $SHELL_CONFIG${NC}"
    echo ""
    echo "To apply changes, run one of these commands:"
    echo -e "${YELLOW}  source $SHELL_CONFIG${NC}"
    echo -e "${YELLOW}  OR restart your terminal${NC}"
fi

echo ""

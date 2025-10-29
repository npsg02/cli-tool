#!/bin/bash
# Script to build CLI tool from src folder

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to show usage
show_usage() {
    cat << EOF
Usage: ./build.sh <project-name>

Build a CLI tool from src folder

Arguments:
    project-name    Name of the project in src/ directory

Examples:
    ./build.sh mytool
    ./build.sh awesome-cli

EOF
}

# Check if correct number of arguments
if [ $# -ne 1 ]; then
    echo -e "${RED}Error: Invalid number of arguments${NC}"
    show_usage
    exit 1
fi

PROJECT_NAME=$1
PROJECT_DIR="src/$PROJECT_NAME"

# Check if project exists
if [ ! -d "$PROJECT_DIR" ]; then
    echo -e "${RED}Error: Project '$PROJECT_DIR' not found${NC}"
    exit 1
fi

echo -e "${GREEN}Building CLI tool '$PROJECT_NAME'...${NC}"

# Detect language and build accordingly
if [ -f "$PROJECT_DIR/main.go" ] && [ -f "$PROJECT_DIR/go.mod" ]; then
    echo -e "${YELLOW}Detected Go project${NC}"
    cd "$PROJECT_DIR"
    go build -o "../../bin/$PROJECT_NAME" main.go
    cd ../..
    echo -e "${GREEN}✓ Built Go binary: bin/$PROJECT_NAME${NC}"

elif [ -f "$PROJECT_DIR/Cargo.toml" ] && [ -f "$PROJECT_DIR/main.rs" ]; then
    echo -e "${YELLOW}Detected Rust project${NC}"
    cd "$PROJECT_DIR"
    cargo build --release
    cp "target/release/$PROJECT_NAME" "../../bin/"
    cd ../..
    echo -e "${GREEN}✓ Built Rust binary: bin/$PROJECT_NAME${NC}"

elif [ -f "$PROJECT_DIR/main.sh" ]; then
    echo -e "${YELLOW}Detected Bash project${NC}"
    cp "$PROJECT_DIR/main.sh" "bin/$PROJECT_NAME"
    chmod +x "bin/$PROJECT_NAME"
    echo -e "${GREEN}✓ Copied Bash script: bin/$PROJECT_NAME${NC}"

elif [ -f "$PROJECT_DIR/main.py" ]; then
    echo -e "${YELLOW}Detected Python project${NC}"
    cp "$PROJECT_DIR/main.py" "bin/$PROJECT_NAME"
    chmod +x "bin/$PROJECT_NAME"
    echo -e "${GREEN}✓ Copied Python script: bin/$PROJECT_NAME${NC}"

elif [ -f "$PROJECT_DIR/main.js" ] && [ -f "$PROJECT_DIR/package.json" ]; then
    echo -e "${YELLOW}Detected Node.js project${NC}"
    cp "$PROJECT_DIR/main.js" "bin/$PROJECT_NAME"
    chmod +x "bin/$PROJECT_NAME"
    echo -e "${GREEN}✓ Copied Node.js script: bin/$PROJECT_NAME${NC}"

else
    echo -e "${RED}Error: Unable to detect project type in '$PROJECT_DIR'${NC}"
    exit 1
fi

echo ""
echo "Binary created at: bin/$PROJECT_NAME"
echo "To add to PATH, run: ./add-to-path.sh"
echo ""

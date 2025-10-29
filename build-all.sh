#!/bin/bash
# Script to build all CLI tools from src folder

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Building all CLI tools in src/ directory...${NC}"
echo ""

# Check if src directory exists and has projects
if [ ! -d "src" ] || [ -z "$(ls -A src)" ]; then
    echo -e "${YELLOW}No projects found in src/ directory${NC}"
    exit 0
fi

# Counter for statistics
TOTAL=0
SUCCESS=0
FAILED=0

# Build each project
for project_dir in src/*; do
    if [ -d "$project_dir" ]; then
        PROJECT_NAME=$(basename "$project_dir")
        TOTAL=$((TOTAL + 1))
        
        echo -e "${YELLOW}Building $PROJECT_NAME...${NC}"
        
        if ./build.sh "$PROJECT_NAME" 2>&1 | grep -q "✓"; then
            SUCCESS=$((SUCCESS + 1))
            echo -e "${GREEN}✓ $PROJECT_NAME built successfully${NC}"
        else
            FAILED=$((FAILED + 1))
            echo -e "${RED}✗ $PROJECT_NAME build failed${NC}"
        fi
        echo ""
    fi
done

# Show summary
echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}Build Summary:${NC}"
echo -e "${GREEN}  Successful: $SUCCESS${NC}"
if [ $FAILED -gt 0 ]; then
    echo -e "${RED}  Failed: $FAILED${NC}"
fi
echo -e "${BLUE}  Total: $TOTAL${NC}"
echo -e "${BLUE}================================${NC}"

if [ $FAILED -gt 0 ]; then
    exit 1
fi

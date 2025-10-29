#!/bin/bash
# Script to generate CLI tool from template

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to show usage
show_usage() {
    cat << EOF
Usage: ./generate.sh <project-name> <language>

Generate a new CLI tool from template

Arguments:
    project-name    Name of the project (e.g., mytool)
    language        Language template to use

Supported languages:
    - bash
    - go
    - node
    - rust
    - python

Examples:
    ./generate.sh mytool bash
    ./generate.sh awesome-cli go
    ./generate.sh my-node-tool node

EOF
}

# Check if correct number of arguments
if [ $# -ne 2 ]; then
    echo -e "${RED}Error: Invalid number of arguments${NC}"
    show_usage
    exit 1
fi

PROJECT_NAME=$1
LANGUAGE=$2

# Validate language
if [[ ! "$LANGUAGE" =~ ^(bash|go|node|rust|python)$ ]]; then
    echo -e "${RED}Error: Unsupported language '$LANGUAGE'${NC}"
    show_usage
    exit 1
fi

# Check if project already exists
if [ -d "src/$PROJECT_NAME" ]; then
    echo -e "${RED}Error: Project 'src/$PROJECT_NAME' already exists${NC}"
    exit 1
fi

# Check if template exists
if [ ! -d "template/$LANGUAGE" ]; then
    echo -e "${RED}Error: Template for '$LANGUAGE' not found${NC}"
    exit 1
fi

echo -e "${GREEN}Generating CLI tool '$PROJECT_NAME' using $LANGUAGE template...${NC}"

# Create project directory
mkdir -p "src/$PROJECT_NAME"

# Copy template files
cp -r "template/$LANGUAGE"/* "src/$PROJECT_NAME/"

# Replace placeholders in all files
echo -e "${YELLOW}Replacing placeholders...${NC}"
find "src/$PROJECT_NAME" -type f -exec sed -i "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" {} +

echo -e "${GREEN}✓ Project '$PROJECT_NAME' created successfully in 'src/$PROJECT_NAME'${NC}"
echo ""
echo "Next steps:"
echo "  1. cd src/$PROJECT_NAME"
echo "  2. Review README.md for usage instructions"
echo "  3. Build your project: ../../build.sh $PROJECT_NAME"
echo ""

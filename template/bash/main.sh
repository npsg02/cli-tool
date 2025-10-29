#!/bin/bash
# {{PROJECT_NAME}} - CLI tool
# Generated from template

set -e

# Function to show help
show_help() {
    cat << EOF
Usage: {{PROJECT_NAME}} [OPTIONS] [COMMAND]

{{PROJECT_NAME}} - A CLI tool built with bash

Commands:
    help        Show this help message
    version     Show version information

Options:
    -h, --help      Show this help message
    -v, --version   Show version information

Examples:
    {{PROJECT_NAME}} help
    {{PROJECT_NAME}} version

EOF
}

# Function to show version
show_version() {
    echo "{{PROJECT_NAME}} version 1.0.0"
}

# Main logic
main() {
    if [ $# -eq 0 ]; then
        show_help
        exit 0
    fi

    case "$1" in
        help|-h|--help)
            show_help
            ;;
        version|-v|--version)
            show_version
            ;;
        *)
            echo "Unknown command: $1"
            echo "Run '{{PROJECT_NAME}} help' for usage information"
            exit 1
            ;;
    esac
}

main "$@"

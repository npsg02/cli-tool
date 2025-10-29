#!/usr/bin/env python3
"""
{{PROJECT_NAME}} - CLI tool
Generated from template
"""

import sys

VERSION = "1.0.0"


def show_help():
    """Show help message"""
    print("""Usage: {{PROJECT_NAME}} [OPTIONS] [COMMAND]

{{PROJECT_NAME}} - A CLI tool built with Python

Commands:
    help        Show this help message
    version     Show version information

Options:
    -h, --help      Show this help message
    -v, --version   Show version information

Examples:
    {{PROJECT_NAME}} help
    {{PROJECT_NAME}} version
""")


def show_version():
    """Show version information"""
    print(f"{{PROJECT_NAME}} version {VERSION}")


def main():
    """Main entry point"""
    if len(sys.argv) < 2:
        show_help()
        return

    command = sys.argv[1]

    if command in ["help", "-h", "--help"]:
        show_help()
    elif command in ["version", "-v", "--version"]:
        show_version()
    else:
        print(f"Unknown command: {command}")
        print("Run '{{PROJECT_NAME}} help' for usage information")
        sys.exit(1)


if __name__ == "__main__":
    main()

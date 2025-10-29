package main

import (
	"fmt"
	"os"
)

const version = "1.0.0"

func showHelp() {
	fmt.Printf(`Usage: {{PROJECT_NAME}} [OPTIONS] [COMMAND]

{{PROJECT_NAME}} - A CLI tool built with Go

Commands:
    help        Show this help message
    version     Show version information

Options:
    -h, --help      Show this help message
    -v, --version   Show version information

Examples:
    {{PROJECT_NAME}} help
    {{PROJECT_NAME}} version

`)
}

func showVersion() {
	fmt.Printf("{{PROJECT_NAME}} version %s\n", version)
}

func main() {
	if len(os.Args) < 2 {
		showHelp()
		return
	}

	switch os.Args[1] {
	case "help", "-h", "--help":
		showHelp()
	case "version", "-v", "--version":
		showVersion()
	default:
		fmt.Printf("Unknown command: %s\n", os.Args[1])
		fmt.Println("Run '{{PROJECT_NAME}} help' for usage information")
		os.Exit(1)
	}
}

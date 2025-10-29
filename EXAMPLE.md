# Complete Usage Example

This document provides a complete walkthrough of creating, building, and using a CLI tool with this project.

## Example: Creating a "greet" CLI Tool

Let's create a simple greeting CLI tool using Go.

### Step 1: Generate the Project

```bash
./generate.sh greet go
```

Output:
```
Generating CLI tool 'greet' using go template...
Replacing placeholders...
✓ Project 'greet' created successfully in 'src/greet'

Next steps:
  1. cd src/greet
  2. Review README.md for usage instructions
  3. Build your project: ../../build.sh greet
```

### Step 2: Customize the Tool (Optional)

Navigate to the project:
```bash
cd src/greet
```

Edit `main.go` to add a custom greeting command:

```go
package main

import (
	"fmt"
	"os"
)

const version = "1.0.0"

func showHelp() {
	fmt.Printf(`Usage: greet [OPTIONS] [COMMAND] [NAME]

greet - A CLI tool to greet people

Commands:
    hello [NAME]   Greet someone with hello
    goodbye [NAME] Say goodbye to someone
    help           Show this help message
    version        Show version information

Options:
    -h, --help      Show this help message
    -v, --version   Show version information

Examples:
    greet hello World
    greet goodbye Friend
    greet version
`)
}

func showVersion() {
	fmt.Printf("greet version %s\n", version)
}

func greetHello(name string) {
	if name == "" {
		name = "World"
	}
	fmt.Printf("Hello, %s! 👋\n", name)
}

func greetGoodbye(name string) {
	if name == "" {
		name = "Friend"
	}
	fmt.Printf("Goodbye, %s! 👋\n", name)
}

func main() {
	if len(os.Args) < 2 {
		showHelp()
		return
	}

	switch os.Args[1] {
	case "hello":
		name := ""
		if len(os.Args) > 2 {
			name = os.Args[2]
		}
		greetHello(name)
	case "goodbye":
		name := ""
		if len(os.Args) > 2 {
			name = os.Args[2]
		}
		greetGoodbye(name)
	case "help", "-h", "--help":
		showHelp()
	case "version", "-v", "--version":
		showVersion()
	default:
		fmt.Printf("Unknown command: %s\n", os.Args[1])
		fmt.Println("Run 'greet help' for usage information")
		os.Exit(1)
	}
}
```

### Step 3: Build the Tool

Return to the root directory and build:
```bash
cd ../..
./build.sh greet
```

Output:
```
Building CLI tool 'greet'...
Detected Go project
✓ Built Go binary: bin/greet

Binary created at: bin/greet
To add to PATH, run: ./add-to-path.sh
```

### Step 4: Test the Tool

```bash
# Test with default greeting
./bin/greet hello
# Output: Hello, World! 👋

# Test with custom name
./bin/greet hello Alice
# Output: Hello, Alice! 👋

# Test goodbye
./bin/greet goodbye Bob
# Output: Goodbye, Bob! 👋

# Check version
./bin/greet version
# Output: greet version 1.0.0

# Check help
./bin/greet help
```

### Step 5: Add to System PATH

Make the tool available system-wide:
```bash
./add-to-path.sh
```

Output:
```
Adding bin directory to PATH...
Bin directory: /path/to/cli-tool/bin
Detected shell config: /home/user/.bashrc

✓ Added bin directory to PATH in /home/user/.bashrc

To apply changes, run one of these commands:
  source /home/user/.bashrc
  OR restart your terminal
```

Apply the changes:
```bash
source ~/.bashrc
```

### Step 6: Use from Anywhere

Now you can use your tool from any directory:
```bash
greet hello "CLI Tool User"
# Output: Hello, CLI Tool User! 👋
```

### Step 7: Remove from PATH (Optional)

If you want to remove the tool from your PATH:
```bash
./remove-from-path.sh
```

## Creating Multiple Tools

You can create and build multiple tools at once:

```bash
# Generate multiple tools
./generate.sh calculator python
./generate.sh file-processor bash
./generate.sh data-analyzer go

# Build all at once
./build-all.sh
```

Output:
```
Building all CLI tools in src/ directory...

Building calculator...
✓ calculator built successfully

Building file-processor...
✓ file-processor built successfully

Building data-analyzer...
✓ data-analyzer built successfully

Building greet...
✓ greet built successfully

================================
Build Summary:
  Successful: 4
  Total: 4
================================
```

## Tips and Best Practices

1. **Choose the right language**: 
   - Use Bash for simple scripts and file operations
   - Use Go for performance-critical tools
   - Use Python for data processing and complex logic
   - Use Node.js for web-related tools
   - Use Rust for system-level tools requiring maximum safety

2. **Keep tools focused**: Each tool should do one thing well

3. **Use descriptive names**: Choose clear, descriptive names for your tools

4. **Add proper error handling**: Extend the templates with robust error handling

5. **Document your tools**: Update the README in each project with usage examples

6. **Version control**: Commit your tools to git for tracking changes

7. **Test thoroughly**: Test your tools with various inputs before deployment

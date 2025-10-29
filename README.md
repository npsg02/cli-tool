# CLI Tool Generator

A project structure for easy and fast CLI tool creation with templates for multiple programming languages.

## Project Structure

```
cli-tool/
├── template/          # Language templates for quick start
│   ├── bash/         # Bash template
│   ├── go/           # Go template
│   ├── node/         # Node.js template
│   ├── python/       # Python template
│   └── rust/         # Rust template
├── src/              # Generated CLI tools from templates
├── bin/              # Built binaries
├── generate.sh       # Generate new CLI tool from template
├── build.sh          # Build a specific CLI tool
├── build-all.sh      # Build all CLI tools
├── add-to-path.sh    # Add bin directory to system PATH
└── remove-from-path.sh # Remove bin directory from system PATH
```

## Quick Start

**See [EXAMPLE.md](EXAMPLE.md) for a complete walkthrough and [QUICKREF.md](QUICKREF.md) for a quick reference!**

### 1. Generate a new CLI tool

```bash
./generate.sh <project-name> <language>
```

Supported languages: `bash`, `go`, `node`, `rust`, `python`

**Examples:**
```bash
./generate.sh mytool bash
./generate.sh awesome-cli go
./generate.sh my-node-tool node
./generate.sh data-processor python
./generate.sh fast-tool rust
```

### 2. Build your CLI tool

```bash
./build.sh <project-name>
```

**Example:**
```bash
./build.sh mytool
```

### 3. Build all CLI tools

```bash
./build-all.sh
```

This will build all projects in the `src/` directory.

### 4. Add bin directory to PATH

```bash
./add-to-path.sh
```

This adds the `bin/` directory to your system PATH, making your CLI tools accessible from anywhere.

After running this command, restart your terminal or run:
```bash
source ~/.bashrc  # or ~/.zshrc for zsh
```

### 5. Remove bin directory from PATH

```bash
./remove-from-path.sh
```

This removes the `bin/` directory from your system PATH.

## Usage Example

```bash
# 1. Generate a new CLI tool called "hello" using bash
./generate.sh hello bash

# 2. Build the CLI tool
./build.sh hello

# 3. Add bin to PATH
./add-to-path.sh
source ~/.bashrc

# 4. Use your CLI tool
hello help
hello version
```

## Template Features

Each template includes:
- Basic command structure (help, version)
- Clean and organized code
- README with usage instructions
- Build/run instructions

### Bash Template
- Simple shell script with argument parsing
- No compilation needed
- Fast execution

### Go Template
- Modern Go structure
- Fast compiled binary
- Cross-platform support

### Node.js Template
- JavaScript/Node.js based
- NPM package structure
- Easy to extend with packages

### Python Template
- Python 3 compatible
- Clean and readable
- Easy to extend

### Rust Template
- High-performance compiled binary
- Memory-safe
- Cargo build system

## Customizing Your CLI Tool

After generating a CLI tool:

1. Navigate to your project:
   ```bash
   cd src/<project-name>
   ```

2. Edit the main file according to the language:
   - Bash: `main.sh`
   - Go: `main.go`
   - Node: `main.js`
   - Python: `main.py`
   - Rust: `main.rs`

3. Build your changes:
   ```bash
   cd ../..
   ./build.sh <project-name>
   ```

## Requirements

Depending on the language you choose, you'll need:

- **Bash**: No additional requirements (available on Unix-like systems)
- **Go**: Go 1.21 or later
- **Node.js**: Node.js 14 or later
- **Python**: Python 3.6 or later
- **Rust**: Rust 1.70 or later (with Cargo)

## Scripts Reference

| Script | Description |
|--------|-------------|
| `generate.sh` | Generate a new CLI tool from template with project name and language |
| `build.sh` | Build a specific CLI tool from src folder to bin folder |
| `build-all.sh` | Build all CLI tools in src folder |
| `add-to-path.sh` | Add bin directory to system PATH for easy access |
| `remove-from-path.sh` | Remove bin directory from system PATH |

## Contributing

To add a new language template:

1. Create a new directory in `template/` with the language name
2. Add the necessary template files
3. Use `{{PROJECT_NAME}}` as a placeholder for the project name
4. Add a README.md with usage instructions
5. Update the `generate.sh` script to support the new language
6. Update the `build.sh` script to handle building the new language

## Troubleshooting

**Problem**: Scripts don't execute  
**Solution**: Make sure scripts are executable: `chmod +x *.sh`

**Problem**: Build fails for Go/Rust  
**Solution**: Ensure the language toolchain is installed (go, cargo, etc.)

**Problem**: PATH changes don't take effect  
**Solution**: Restart your terminal or run `source ~/.bashrc` (or `~/.zshrc`)

**Problem**: Permission denied when running binaries  
**Solution**: Make sure the binary is executable: `chmod +x bin/your-tool`

## License

ISC
# Quick Reference Guide

## Commands Cheat Sheet

### Generate a New CLI Tool
```bash
./generate.sh <project-name> <language>
```
Languages: `bash`, `go`, `node`, `python`, `rust`

### Build Commands
```bash
# Build single project
./build.sh <project-name>

# Build all projects
./build-all.sh
```

### PATH Management
```bash
# Add bin directory to PATH
./add-to-path.sh

# Remove bin directory from PATH
./remove-from-path.sh

# Apply PATH changes
source ~/.bashrc  # or ~/.zshrc
```

### Using Built Tools
```bash
# After building
./bin/<project-name> <command>

# After adding to PATH
<project-name> <command>
```

## Language Requirements

| Language | Requirement | Check Command |
|----------|-------------|---------------|
| Bash | Built-in on Unix | `bash --version` |
| Go | Go 1.19+ | `go version` |
| Node.js | Node 14+ | `node --version` |
| Python | Python 3.8+ | `python3 --version` |
| Rust | Rust 1.65+ | `rustc --version` |

## Project File Structure

```
your-project/
├── main.{sh,go,js,py,rs}  # Main source file
├── README.md              # Project documentation
├── go.mod                 # Go only
├── package.json           # Node only
└── Cargo.toml             # Rust only
```

## Common Use Cases

### Creating a Simple Script Tool
```bash
./generate.sh myscript bash
cd src/myscript
# Edit main.sh
cd ../..
./build.sh myscript
```

### Creating a Performant Binary
```bash
./generate.sh fastapp go
# or
./generate.sh fastapp rust
```

### Creating a Data Processing Tool
```bash
./generate.sh dataproc python
```

### Creating Multiple Tools
```bash
./generate.sh tool1 bash
./generate.sh tool2 go
./generate.sh tool3 python
./build-all.sh
```

## Template Placeholder

All templates use `{{PROJECT_NAME}}` as a placeholder that gets replaced with your project name during generation.

## Tips

1. **Project Naming**: Use lowercase with hyphens (e.g., `my-tool`, not `MyTool`)
2. **Test Locally**: Test with `./bin/<name>` before adding to PATH
3. **Version Control**: Commit your src/ projects to git
4. **Ignore Binaries**: The .gitignore already excludes bin/ contents
5. **Update Templates**: Modify template/ files to customize defaults

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Permission denied | `chmod +x <script>` |
| Command not found | Check PATH with `echo $PATH` |
| Build fails | Check language toolchain is installed |
| PATH not updating | Restart terminal or `source ~/.bashrc` |

## File Locations

- **Templates**: `template/<language>/`
- **Projects**: `src/<project-name>/`
- **Binaries**: `bin/<project-name>`
- **Scripts**: Root directory (`./*.sh`)

## Next Steps

1. Read [EXAMPLE.md](EXAMPLE.md) for a detailed walkthrough
2. Read [README.md](README.md) for full documentation
3. Start creating your first CLI tool!

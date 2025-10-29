#!/usr/bin/env node

const version = '1.0.0';

function showHelp() {
  console.log(`Usage: {{PROJECT_NAME}} [OPTIONS] [COMMAND]

{{PROJECT_NAME}} - A CLI tool built with Node.js

Commands:
    help        Show this help message
    version     Show version information

Options:
    -h, --help      Show this help message
    -v, --version   Show version information

Examples:
    {{PROJECT_NAME}} help
    {{PROJECT_NAME}} version
`);
}

function showVersion() {
  console.log(`{{PROJECT_NAME}} version ${version}`);
}

function main() {
  const args = process.argv.slice(2);

  if (args.length === 0) {
    showHelp();
    return;
  }

  switch (args[0]) {
    case 'help':
    case '-h':
    case '--help':
      showHelp();
      break;
    case 'version':
    case '-v':
    case '--version':
      showVersion();
      break;
    default:
      console.log(`Unknown command: ${args[0]}`);
      console.log("Run '{{PROJECT_NAME}} help' for usage information");
      process.exit(1);
  }
}

main();

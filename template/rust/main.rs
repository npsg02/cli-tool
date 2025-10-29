use std::env;
use std::process;

const VERSION: &str = "1.0.0";

fn show_help() {
    println!(
        r#"Usage: {{{{PROJECT_NAME}}}} [OPTIONS] [COMMAND]

{{{{PROJECT_NAME}}}} - A CLI tool built with Rust

Commands:
    help        Show this help message
    version     Show version information

Options:
    -h, --help      Show this help message
    -v, --version   Show version information

Examples:
    {{{{PROJECT_NAME}}}} help
    {{{{PROJECT_NAME}}}} version
"#
    );
}

fn show_version() {
    println!("{{{{PROJECT_NAME}}}} version {}", VERSION);
}

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        show_help();
        return;
    }

    match args[1].as_str() {
        "help" | "-h" | "--help" => show_help(),
        "version" | "-v" | "--version" => show_version(),
        _ => {
            println!("Unknown command: {}", args[1]);
            println!("Run '{{{{PROJECT_NAME}}}} help' for usage information");
            process::exit(1);
        }
    }
}

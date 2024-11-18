use oxc_allocator::Allocator;
use oxc_parser::{Parser, ParserReturn};
use oxc_span::SourceType;

fn main() {
    let source_text = r"
function fib(n: number) {
    return n + 2;
}
console.log(fib(3));
";

    // Memory arena where AST nodes get stored
    let allocator = Allocator::default();
    // Infers TypeScript
    let source_type = SourceType::from_path("t01.ts").unwrap();

    let ParserReturn {
        program,  // AST
        errors,   // Syntax errors
        panicked, // Parser encountered an error it couldn't recover from
        ..
    } = Parser::new(&allocator, source_text, source_type).parse();

    println!("Errors: {:?}", errors);
    assert!(!panicked);
    println!("AST:\n{:#?}", program);
}
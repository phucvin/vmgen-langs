use oxc_allocator::Allocator;
use oxc_parser::{Parser, ParserReturn};
use oxc_ast::{
    ast::{Class, Function, TSImportType},
    visit::walk_mut,
    VisitMut,
};
use oxc_span::SourceType;
use oxc_syntax::scope::ScopeFlags;

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
        mut program,  // AST
        errors,   // Syntax errors
        panicked, // Parser encountered an error it couldn't recover from
        ..
    } = Parser::new(&allocator, source_text, source_type).parse();

    println!("Errors: {:?}", errors);
    assert!(!panicked);
    println!("AST:\n{:#?}", program);

    let mut pass01 = Pass01::default();
    pass01.visit_program(&mut program);
    println!("{pass01:?}");
}

#[derive(Debug, Default)]
struct Pass01 {
    functions: usize,
    classes: usize,
    ts_import_types: usize,
}

impl<'a> VisitMut<'a> for Pass01 {
    fn visit_function(&mut self, func: &mut Function<'a>, flags: ScopeFlags) {
        self.functions += 1;
        walk_mut::walk_function(self, func, flags);
    }

    fn visit_class(&mut self, class: &mut Class<'a>) {
        self.classes += 1;
        walk_mut::walk_class(self, class);
    }

    fn visit_ts_import_type(&mut self, ty: &mut TSImportType<'a>) {
        self.ts_import_types += 1;
        walk_mut::walk_ts_import_type(self, ty);
    }
}
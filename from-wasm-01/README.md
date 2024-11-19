TODO:
- Write Python code to transpile Wasm/Wat input to stack-assembly-03/stack-assembly-04 code
- The output code should translate the following Wat code to something similar to the handwritten version of fib in the target language
```
(module
 (memory $0 1)
 (export "memory" (memory $0))
 (export "fib" (func $fib))
 (func $fib (; 0 ;) (param $0 i32) (result i32)
  (block $label$0
   (br_if $label$0
    (i32.ge_s
     (local.get $0)
     (i32.const 2)
    )
   )
   (return
    (local.get $0)
   )
  )
  (i32.add
   (call $fib
    (i32.add
     (local.get $0)
     (i32.const -1)
    )
   )
   (call $fib
    (i32.add
     (local.get $0)
     (i32.const -2)
    )
   )
  )
 )
)
```

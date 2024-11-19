
```
$ python transpiler.py fib.wasm fib.generated.wasm
```

TODO:
- Write Python code to transpile Wasm/Wat input to stack-assembly-03/stack-assembly-04 code
- The output code should translate the following Wat code (or the corresponding Wasm binary) to something similar to the handwritten version of fib in the target language
```
(module
  (func (;0;) (export "fib") (param i32) (result i32)
    (if
      (i32.lt_u
        (local.get 0)
        (i32.const 2))
      (then
        (return
          (local.get 0))))
    (return
      (i32.add
        (call 0
          (i32.sub
            (local.get 0)
            (i32.const 2)))
        (call 0
          (i32.sub
            (local.get 0)
            (i32.const 1)))))))
```
```
0000000: 0061 736d                                 ; WASM_BINARY_MAGIC
0000004: 0100 0000                                 ; WASM_BINARY_VERSION
; section "Type" (1)
0000008: 01                                        ; section code
0000009: 00                                        ; section size (guess)
000000a: 01                                        ; num types
; func type 0
000000b: 60                                        ; func
000000c: 01                                        ; num params
000000d: 7f                                        ; i32
000000e: 01                                        ; num results
000000f: 7f                                        ; i32
0000009: 06                                        ; FIXUP section size
; section "Function" (3)
0000010: 03                                        ; section code
0000011: 00                                        ; section size (guess)
0000012: 01                                        ; num functions
0000013: 00                                        ; function 0 signature index
0000011: 02                                        ; FIXUP section size
; section "Export" (7)
0000014: 07                                        ; section code
0000015: 00                                        ; section size (guess)
0000016: 01                                        ; num exports
0000017: 03                                        ; string length
0000018: 6669 62                                  fib  ; export name
000001b: 00                                        ; export kind
000001c: 00                                        ; export func index
0000015: 07                                        ; FIXUP section size
; section "Code" (10)
000001d: 0a                                        ; section code
000001e: 00                                        ; section size (guess)
000001f: 01                                        ; num functions
; function body 0
0000020: 00                                        ; func body size (guess)
0000021: 00                                        ; local decl count
0000022: 20                                        ; local.get
0000023: 00                                        ; local index
0000024: 41                                        ; i32.const
0000025: 02                                        ; i32 literal
0000026: 49                                        ; i32.lt_u
0000027: 04                                        ; if
0000028: 40                                        ; void
0000029: 20                                        ; local.get
000002a: 00                                        ; local index
000002b: 0f                                        ; return
000002c: 0b                                        ; end
000002d: 20                                        ; local.get
000002e: 00                                        ; local index
000002f: 41                                        ; i32.const
0000030: 02                                        ; i32 literal
0000031: 6b                                        ; i32.sub
0000032: 10                                        ; call
0000033: 00                                        ; function index
0000034: 20                                        ; local.get
0000035: 00                                        ; local index
0000036: 41                                        ; i32.const
0000037: 01                                        ; i32 literal
0000038: 6b                                        ; i32.sub
0000039: 10                                        ; call
000003a: 00                                        ; function index
000003b: 6a                                        ; i32.add
000003c: 0f                                        ; return
000003d: 0b                                        ; end
0000020: 1d                                        ; FIXUP func body size
000001e: 1f                                        ; FIXUP section size
; section "name"
000003e: 00                                        ; section code
000003f: 00                                        ; section size (guess)
0000040: 04                                        ; string length
0000041: 6e61 6d65                                name  ; custom section name
0000045: 02                                        ; local name type
0000046: 00                                        ; subsection size (guess)
0000047: 01                                        ; num functions
0000048: 00                                        ; function index
0000049: 00                                        ; num locals
0000046: 03                                        ; FIXUP subsection size
000003f: 0a                                        ; FIXUP section size
```

TODO:
- Write read wasm input and call `gen_*` to generate bytecode (similar to stack-assembly-03) directly

```
$ npm install -g @irongeek/wabt
$ wat2wasm examples/fib01.wat
$ make vm
$ time ./vm.out examples/fib01.wasm
```
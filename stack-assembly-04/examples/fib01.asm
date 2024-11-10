// compute fib(N) and print the result

@main:
  push #40
  call @fib #1  // call with 1 parameter already pushed on the stack
  halt ~1

@fib:
  // stack is now s( ret_addr | n )
  alloc #3  // s(| n . . . )
  jump_lt @@base_case f0 #2  // stack remains the same
  sub f0 #1  // s(| n . . . n-1 )
  call @fib #1  // s(| n . . . fib(n-1) )
  store f1 // s(| n fib(n-1) . . )
  sub f1 #2  // s(| n fib(n-1) . . n-2 )
  call @fib #1  // s(| n fib(n-1) . . fib(n-2) )
  store f2 // s(| n fib(n-1) fib(n-2) . )
  add f1 f2  // s(| n fib(n-1) fib(n-2) . result )
  store f3  // s(| n fib(n-1) fib(n-2) result )
  // return using return address in ~3, return value in ~1
  // this also remove everything in the stack up until the return address and
  // leaves just the return value on top before giving control back to the caller
  ret f3  // s( result )
@@base_case:
  // now s( ret_addr | n . . . )
  ret f0
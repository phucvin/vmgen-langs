// compute fib(N) and print the result

@main:
  push #40
  call @fib #1  // call with 1 parameter already pushed on the stack
  halt

@fib:
  // stack is now s( ret_addr | n )
  alloc #3  // s(| n . . . )
  jump_lt @@base_case |0 #2  // stack remains the same
  sub |0 #1  // s(| n . . . n-1 )
  call @fib #1  // s(| n . . . fib(n-1) )
  store |1 // s(| n fib(n-1) . . )
  sub |0 #2  // s(| n fib(n-1) . . n-2 )
  call @fib #1  // s(| n fib(n-1) . . fib(n-2) )
  store |2 // s(| n fib(n-1) fib(n-2) . )
  add |1 |2  // s(| n fib(n-1) fib(n-2) . result )
  store |3  // s(| n fib(n-1) fib(n-2) result )
  // return using return address in ~3, return value in ~1
  // this also remove everything in the stack up until the return address and
  // leaves just the return value on top before giving control back to the caller
  ret |3  // s( result )
@@base_case:
  // now s( ret_addr | n . . . )
  ret |0
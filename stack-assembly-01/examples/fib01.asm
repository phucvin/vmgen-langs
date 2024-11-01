// compute fib(N) and print the result

@main:
// prepare to call fib :: s( return_address n ) > s( n )
  push @main_end
  push #6
  jump @fib
@main_end:
  puti
  halt

// fib :: s( return_address n ) > s( n )
@fib:
// -> (.. n n ) to keep n after jump
  dup
  push #2
// s(.. n 2 ), jump to @fib_base_case if n < 2, fallthrough if not
  jump_if_lt @fib_base_case 
@fib_recursive_case:
// -> s(.. n n )
  dup
  add #1
// -> s(.. n n-1 )
  sub
  push @fib_recursive_case_01
// -> s(.. n @fib_recursive_case_01 n-1 )
  swap
  jump @fib
@fib_recursive_case_01:
// s(.. n fib(n-1) ) -> s(.. fib(n-1) n )
  add #2
  sub
  push @fib_recursive_case_02
// -> s(.. fib(n-1) @fib_recursive_case_02 n-2)
  swap
  jump @fib
// s(.. return_address fib(n-1) fib(n-2) ) -> s(.. return_address result)
  add
  swap
  jump_tos
@fib_base_case:
// -> s(.. n return_address )
  swap
  jump_tos
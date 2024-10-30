// compute fib(N) and print the result

@main:
// prepare to call fib :: s( return_address n ) > s( n )
  push @end
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
// s(.. n 2 ), jump to @base_case if n < 2, fallthrough if not
  jump_if_lt @fib_base_case 
@fib_recursive_case:
// TODO
@fib_base_case:
// -> s(.. n return_address )
  swap
  jump_tos
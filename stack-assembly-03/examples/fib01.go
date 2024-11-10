// TODO: parse and compile this to generate something similar to fib01.asm

package main

func fib(n int) int {
    if n < 2 {
        return n
    }
    return fib(n-1) + fib(n-2)
}

func main() int {
	return fib(40)
}
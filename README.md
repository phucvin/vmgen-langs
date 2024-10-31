# vmgen-langs
Interpreted programming languages using vmgen

## Build

Build vmgen:
```
$ mkdir tmp01 && cd tmp01
$ git clone https://github.com/phucvin/gforth
$ cd gforth
$ source ./install-deps.sh
$ vmgen --help
$ sudo apt update && sudo apt install flex -y
$ cd vmgen-myex01
$ make
$ time ./mini fib.mini
result = 102334155
real    0m2.213s
```

Build stack-assembly-01:
```
$ cd stack-assembly-01
$ make
$ time ./vm.out fib_old.asm
```

## Appendix

Learn Vmgen:
- http://www.complang.tuwien.ac.at/anton/vmgen/
- See commit history of `learn-vmgen-01`
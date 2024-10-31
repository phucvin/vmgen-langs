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
```
$ cd learn-vmgen-01
$ make vm && time vm.out
vm assembly:
0x5685dd2372a0: set_rl i0=0  i1=40 
0x5685dd2372b8: s_pljl _IP0=0x5685dd2372d0  _IP1=0x5685dd2372e8 
0x5685dd2372d0: push_r i0=0 
0x5685dd2372e0: end
0x5685dd2372e8: jump_l_if_r_lt_l target0=0x5685dd2373d8  i0=0  i1=2 
0x5685dd237308: push_r i0=0 
0x5685dd237318: sub_rrl i0=0  i1=0  i2=1 
0x5685dd237338: s_pljl _IP0=0x5685dd237350  _IP1=0x5685dd2372e8 
0x5685dd237350: pop_r i0=1 
0x5685dd237360: push_r i0=0 
0x5685dd237370: sub_rrl i0=0  i1=1  i2=2 
0x5685dd237390: s_pljl _IP0=0x5685dd2373a8  _IP1=0x5685dd2372e8 
0x5685dd2373a8: pop_r i0=1 
0x5685dd2373b8: add_rrr i0=0  i1=0  i2=1 
0x5685dd2373d8: jump

vm run:
return code: 102334155

real    0m2.097s
```
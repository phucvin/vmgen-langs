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
$ make vm && ./vm.out examples/simple01.asm
```

## Appendix

Learn Vmgen:
- http://www.complang.tuwien.ac.at/anton/vmgen/
- See commit history of `learn-vmgen-01`
```
$ cd learn-vmgen-01
$ make vm && time ./vm.out
vm assembly:
0x584f46aa22a0: set_rl i0=0  i1=40 
0x584f46aa22b8: s_pljl _IP0=0x584f46aa22d0  _IP1=0x584f46aa22e8 
0x584f46aa22d0: push_r i0=0 
0x584f46aa22e0: end
0x584f46aa22e8: jump_l_if_r_lt_l target0=0x584f46aa23d8  i0=0  i1=2 
0x584f46aa2308: push_r i0=0 
0x584f46aa2318: sub_rrl i0=0  i1=0  i2=1 
0x584f46aa2338: s_pljl _IP0=0x584f46aa2350  _IP1=0x584f46aa22e8 
0x584f46aa2350: pop_r i0=1 
0x584f46aa2360: push_r i0=0 
0x584f46aa2370: sub_rrl i0=0  i1=1  i2=2 
0x584f46aa2390: s_pljl _IP0=0x584f46aa23a8  _IP1=0x584f46aa22e8 
0x584f46aa23a8: pop_r i0=1 
0x584f46aa23b8: add_rrr i0=0  i1=0  i2=1 
0x584f46aa23d8: jump

vm run:
return code: 102334155

real    0m2.145s
```
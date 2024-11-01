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
$ make vm
$ time ./vm.out examples/simple01.asm
```

## Appendix

Learn Vmgen:
- http://www.complang.tuwien.ac.at/anton/vmgen/
- See commit history of `learn-vmgen-01`
```
$ cd learn-vmgen-01
$ make vm && time vm.out
vm assembly:
0x6051305f12a0: set_r0l i0=40 
0x6051305f12b0: s_pljl _IP0=0x6051305f12c8  _IP1=0x6051305f12d8 
0x6051305f12c8: push_r0
0x6051305f12d0: end
0x6051305f12d8: jump_l_if_r0_lt_l target0=0x6051305f1368  i0=2 
0x6051305f12f0: push_r0
0x6051305f12f8: sub_r0r0l i0=1 
0x6051305f1308: s_pljl _IP0=0x6051305f1320  _IP1=0x6051305f12d8 
0x6051305f1320: pop_r1
0x6051305f1328: push_r0
0x6051305f1330: sub_r0r1l i0=2 
0x6051305f1340: s_pljl _IP0=0x6051305f1358  _IP1=0x6051305f12d8 
0x6051305f1358: pop_r1
0x6051305f1360: add_r0r0r1
0x6051305f1368: jump

vm run:
return code: 102334155

real    0m2.145s
```
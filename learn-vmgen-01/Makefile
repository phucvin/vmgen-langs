VMGEN=vmgen
GCC=gcc -O3 -fomit-frame-pointer -Wall
CC=$(GCC)
M4=m4
OBJECTS_VM=main.o peephole.o profile.o disasm.o engine.o engine-debug.o

vm: $(OBJECTS_VM)
	$(CC) $(OBJECTS_VM) -o vm.out

vm-vm.i vm-disasm.i vm-gen.i vm-labels.i vm-profile.i vm-peephole.i: vm.vmg
	$(VMGEN) vm.vmg

main.o: main.c vm.h vm-gen.i

peephole.o: peephole.c vm-peephole.i vm.h

profile.o: profile.c vm-profile.i vm.h

disasm.o: disasm.c vm-disasm.i vm.h

engine.o: engine.c vm-vm.i vm-labels.i vm.h

engine-debug.o: engine.c vm-vm.i vm-labels.i vm.h
	$(CC) -DVM_DEBUG -DVM_PROFILING -Dengine=engine_debug -c -o $@ engine.c

clean:
	rm -f *.o *.out

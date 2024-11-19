import sys

if len(sys.argv) != 3:
    print("usage: python transpile.py <input.wasm> <output.asm>")
    exit(1)

with open(sys.argv[1], "rb") as f:
    while (byte := f.read(1)):
        print(byte)
        if (byte == b'\x61'): break
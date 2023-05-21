# NBLib

NASM Basic Lib is a list of basic functions to use in your simple assembler programs. 

Maybe I'll add a few more.

### Compile && Play

```bash
nasm -f elf32 -I includes examples/hello_world.asm
ld -m elf_i386 -o hello_world examples/hello_world.o lib/stdio.o lib/stdlib.o
./hello_world
```

### Available Functions

**stdio**
- [x] sprint (simple print) 
- [x] sread (simple read)

**stdlib**
- [x] atoi 
- [x] exit

**string**
- [x] strlen
- [x] strcpy
- [x] strcat
- [x] strrev

**ctype**

- [x] toupper
- [x] tolower

### Motivation

I'm reading Irvine's book and I don't feel like creating a VM just to use MASM, therefore I prefer to learn more by creating some functions on my own but with NASM. Not all of them can be created, but the basic ones will be enough to learn.

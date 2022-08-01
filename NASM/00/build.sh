nasm -f elf hello_world.asm
ld -m elf_i386 -s -o hello_world hello_world.o

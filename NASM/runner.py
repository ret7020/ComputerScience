import os

path_to_asm = input("Path to asm file")
file_name = input("Only file name without extension but with path")
print("Compile to object file")
os.system(f"nasm -f elf {path_to_asm}")
print("Link with ld linker")
os.system(f"ld -m elf_i386 -s -o {file_name} {file_name}.o")
print("Running")



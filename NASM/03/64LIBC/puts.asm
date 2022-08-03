extern puts
extern exit ; libc function to exit

section .text
    global _start

_start:
    mov rdi, msg
    call puts
    mov rdi, 0
    call exit ; We will use libc exit

section .data
    msg db "Hello, world from glibc!"

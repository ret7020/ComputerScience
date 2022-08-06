extern printf
extern exit
section .text
    global _start

%macro exc 1 ; macro keyword, macro name, macro args
    mov rdi, %1
    call exit
%endmacro


_start:
    mov rdi, msg
    call printf
    jmp _start
    call exc 0
    

section .data
    msg db "Hello, world!", 0xA


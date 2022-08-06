extern printf
extern exit
section .text
    global _start

%macro exc 1 ; macro keyword, macro name, macro args
    mov rdi, %1
    call exit
%endmacro


_start:   
    mov ecx, 10
    
l1:
    push ecx
    mov rdi, msg
    call printf
    pop ecx
    loop l1
    call exc 0

section .data
    msg db "Hello, world!", 0xA


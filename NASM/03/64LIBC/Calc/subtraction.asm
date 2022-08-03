extern printf
extern exit
%macro exc 1 ; macro keyword, macro name, macro args
    mov rdi, %1
    call exit
%endmacro

extern exit

; Finish macros
section .text
    global _start
 
_start:
    mov rax, [first]
    sub rax, [second]
    mov rdi, output
    mov rsi, [first]
    mov rdx, [second]
    mov rcx, rax
    
    call printf
    exc 0
    
section .data
    first dd -10
    second dd 20
    output db "%d - %d = %d", 0xA


; eax, ebx, ecx..... - 32 BIT registers
; rax, rbx, rcx..... - 64 BIT registers

section .text
    global _start

_start:
    ; Simple registers test
    mov rax, 10
    mov rbx, 20
    ; Exit
    mov rax, 1 ; We have to use 64 bit regs everywhere
    mov rbx, 0
    int 0x80


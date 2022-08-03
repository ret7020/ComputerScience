section .text
    global _start

_start:
    mov rdi, 0x1 ; STDOUT register
    mov rsi, hello ; message
    mov rdx, helloLen ; message length
    mov rax, 1 ; sys write ?

    syscall ; we can replace magic 0x80 to `syscall`
    mov rax, 60
    mov rdi, 0
    syscall

section .data
    hello db "Hello World", 0xA
    helloLen equ $ - hello

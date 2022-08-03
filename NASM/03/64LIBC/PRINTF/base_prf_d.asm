extern printf
extern exit
section .text
    global _start

_start:
    
    mov rdi, msg
    mov rsi, 5555
    mov rdx, 15
    call printf
    ; Exit
    mov rdi, 0
    call exit
section .data
    msg db "Test number: %d", 0xA, "Another number: %d", 0xA ; digit

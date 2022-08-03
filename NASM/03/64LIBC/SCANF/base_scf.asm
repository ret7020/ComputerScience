extern printf
extern scanf
extern exit
section .text
    global _start

_start:
    mov rdi, inp_req
    call printf

    mov rsi, n
    mov rdi, scan_str
    mov al, 0
    call scanf

    mov rdi, msg
    mov rsi, [n]
    call printf

    ; Exit
    mov rdi, 0
    call exit
section .bss
    n resb 4

section .data
    inp_req db "Please input some number: ", 0
    scan_str db "%d"
    msg db "Inputted number: %d", 0xA ; digit


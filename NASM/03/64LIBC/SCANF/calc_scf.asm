extern printf
extern scanf
extern exit
section .text
    global _start



_start:
    mov rdi, inp_req_0
    call printf

    mov rsi, n
    mov rdi, scan_str
    mov al, 0
    call scanf
    
    mov rdi, inp_req_1
    call printf

    mov rsi, k
    mov rdi, scan_str
    mov al, 0
    call scanf
    
  
    mov rdi, msg
    mov rsi, [n]
    add rsi, [k]
    call printf

    ; Exit
    mov rdi, 0
    call exit
section .bss
    n resb 5
    k resb 5

section .data
    inp_req_0 db "Firt number: ", 0
    scan_str db "%d"
    inp_req_1 db "Second number: ", 0
    msg db "Sum: %d", 0xA ; digit


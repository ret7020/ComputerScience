extern printf
extern scanf
extern exit
section .text
    global _start

%macro exc 1 ; macro keyword, macro name, macro args
    mov rdi, %1
    call exit
%endmacro

%macro inp_num 0; Macros for scanf num input
    mov rdi, scan_str
    mov al, 0
    call scanf
%endmacro

_add:
    add rax, [k]
    mov rdi, result
    mov rsi, rax
    call printf
    jmp _start

_sub:
    sub rax, [k]
    mov rdi, result
    mov rsi, rax
    call printf
    jmp _start

_mul:
    mov al, [n]
    mov bl, [k]
    imul bl ; multiply correct if numbers < 0(check mul/imul diff)

    mov rdi, result 
    mov rsi, rax
    call printf
    jmp _start
    
_div:
    mov ax, [n]
    mov bl, [k]
    div bl

    mov rdi, result 
    mov rsi, ah
    call printf
    jmp _start



_start:
    

    mov rdi, inp_req_0
    call printf

    mov rsi, n
    inp_num
    
    mov rdi, inp_req_1
    call printf
    
    mov rsi, k
    inp_num
    call scanf

    mov rdi, inp_req_2
    call printf
    
    mov rsi, op
    inp_num
    call scanf

    mov rcx, [op] ; Move to register to check val in cmp
    mov rax, [n] ; Store number in register to operate with it

    cmp rcx, 0
    je _add    

    cmp rcx, 1
    je _sub

    cmp rcx, 2
    je _mul
      
section .bss
    n resb 5
    k resb 5
    op resb 1

section .data
    inp_req_0 db "Firt number: ", 0
    scan_str db "%d"
    inp_req_1 db "Second number: ", 0
    inp_req_2 db "Operation num id(+, -, *, /, exit): ", 0
    result db "Res: %d", 0xA ; digit
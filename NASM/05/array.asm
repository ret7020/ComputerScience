extern exit
extern printf

section .text
    global _start

%macro exc 1 ; macro keyword, macro name, macro args
    mov rdi, %1
    call exit
%endmacro


_start:
    mov rax, 3 ; Bytes count to summate(array length)
    mov rbx, 0 ; sum
    mov rcx, x ; current item for summate(like i iterator in for loop)

top:  ; Iterate over array procedure
   add  rbx, [rcx] ; Add item value to sum register
   add  rcx, 1      ; move pointer to next array item
   dec  rax        ; decrement array length counter
   jnz  top        ; if counter not 0 execute this procedure again. while we have passed through the entire array

show:
    mov rdi, msg ; printf base format string
    mov rsi, rbx ; sum to rsi register
    call printf
    call exc 0

section .data
    global x ; Our array
    x: ; Array items
        db 1
        db 2
        db 3

    msg db "%d", 0xA

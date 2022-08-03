; exit using libc and macros with any exit code
; test exit code with `echo $?`
; Init macros
%macro exc 1 ; macro keyword, macro name, macro args
    mov rdi, %1
    call exit
%endmacro

extern exit

; Finish macros
section .text
    global _start
    
_start:
    exc 10
    


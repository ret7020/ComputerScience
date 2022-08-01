section .text
   global _start     ;main function for linker
     
_start:             ;in point for linker
   mov  edx, len     ;message length
   mov  ecx, msg     ;message to write
   call print
   xor exit_code, exit_code
   call exit

;|Input:
;edx - message len
;ecx - message content(string)
;|Output: printing string
print:
   mov ebx, 1; file descriptor stdout
   mov eax, 4; sys call: sys_write
   int 0x80

exit:
   mov eax, 1
   mov ebx, exit_code
   int 0x80

 
section .data
msg db 'Hello, world!', 0xa  ;string for print
;msg times 10 db "*" ; 10 symbols of '*' (******....)
len equ $ - msg     ;string length
exit_code = 1

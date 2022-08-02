section .text
   global _start     ;main function for linker
     
_start:             ;in point for linker
   mov edx, len_req_0    ;message length
   mov ecx, req_0     ;message to write
   call print
   mov ecx, first_number
   call input
   mov edx, len_req_1
   mov ecx, req_1
   call print
   mov ecx, second_number
   call input

   mov eax, 1
   mov ecx, 2
   add ecx, 12
   ;mov ecx, result
   mov edx, 10
   call print
   
   ;mov edx, 10
   ;mov ecx, inputed_data
   ;call print
   call exit

;|Input:
;edx - message len
;ecx - message content(string)
;|Output: printing string
print:
   mov ebx, 1; file descriptor stdout
   mov eax, 4; sys call: sys_write
   int 0x80
   ret

input:
   mov eax, 3
   mov ebx, 2
   mov edx, 10          ; 5 bytes for data
   int 0x80
   ret

exit:
   mov eax, 1
   mov ebx, exit_code
   int 0x80

section .bss           ; Not initalized data
   first_number resb 10 ; Reserve 10 bytes for input data
   second_number resb 10 ;
   result resb 10
   
 
section .data
req_0 db "First number:"  ;string for print
len_req_0 equ $ - req_0     ;string length
req_1 db "Second number:"
len_req_1 equ $ - req_1
exit_code equ 0 ; final status code after app finish execution


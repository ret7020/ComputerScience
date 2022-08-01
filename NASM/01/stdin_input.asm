section .text
   global _start     ;main function for linker
     
_start:             ;in point for linker
   mov edx, len_msg_inp_req     ;message length
   mov ecx, msg_inp_req     ;message to write
   call print
   call input
   mov edx, len_msg_inputed_title
   mov ecx, msg_inputed_title
   call print
   mov edx, 5
   mov ecx, inputed_data
   call print
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
   mov ecx, inputed_data
   mov edx, 5          ; 5 bytes for data
   int 0x80
   ret

exit:
   mov eax, 1
   mov ebx, exit_code
   int 0x80

section .bss           ; Not initalized data
   inputed_data resb 5 ; Reserve 5 bytes for input data
 
section .data
msg_inp_req db "Input something and press Enter:", 0xa  ;string for print
len_msg_inp_req equ $ - msg_inp_req     ;string length
msg_inputed_title db "You entered: "
len_msg_inputed_title equ $ - msg_inputed_title
exit_code equ 0 ; final status code after app finish execution


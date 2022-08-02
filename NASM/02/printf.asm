section .text
	global main
	extern printf

main:

  	mov rax, 45
  	mov rbx, 55
  	add rax, rbx
  	push rax
  	push message
  	;call printf
        add rsp, 8
  	mov rax, 1
        mov rbx, 0
        int 0x80

section .data
message db "Value = %d", 10, 0

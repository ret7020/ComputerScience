format ELF64 executable
entry _start

_start:
	mov rax, 1000
        mov rdx, 1000
  	mov rbx, 1000
	mov rcx, 1000
	
	int 0x80
	call exit
	
exit:
	mov rax, 1
	mov rbx, 0
	int 0x80

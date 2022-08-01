format ELF64 executable ; binary format ELF(for linux) with 64 bit architecture 
entry _start ; in point

msg db "Hello, world!", 0xA, 0 ; New variable (var name var type var value) 0xA - \n reg

; db - data byte
; byte - 8 bit (db)
; word - 16 bit (dw)
; dword - 32 bit (dw)
; qword - 64 bit (dq) WORK ONLY IF 64 bit building (ELF64)

_start: ; Function(like main)
   mov rax, msg
   call print ; our own procedure
   call exit ; Execute procedure exit

print:
    push rax
    push rbx
    push rcx
    push rdx
    mov rcx, rax
    call length_string
    mov rdx, rax
    mov rax, 4
    mov rbx, 1
    int 0x80
    pop rdx
    pop rcx
    pop rbx
    pop rax
    ret

; Procedure to get string length
; Input rax - string
; Output rdx - string length
length_string:
    push rdx ; save last rdx value to stack
    xor rdx, rdx ; clear rdx(alternative to mov rdx, 0)
    .next_iter: ; internal procedure
        cmp [rax + rdx], byte 0 ; interrupt out 'loop' when rax + rdx is zero(end of string)
	je .close
 	inc rdx
        jmp .next_iter ; like for loop(goto)    
    .close:
        mov rax, rdx
        pop rdx ; use rdx value from stack
	ret
    
exit: ; our custom procedure
    mov rax, 1 ; send 1 to reg(exit)
    mov rbx, 0 ; 0 - return code(0 - no errors)
    int 0x80 ; req to operating system to confirm actions of changed regs


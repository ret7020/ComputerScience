format ELF64 ; binary format ELF(for linux) with 64 bit architecture
public _start ; program start procedure


msg db "Hello, world!", 0xA, 0 ; New variable (var name var type var value) 0xA - \n reg
len = $-msg ; current var address minus string var start
; db - data byte
; byte - 8 bit (db)
; word - 16 bit (dw)
; dword - 32 bit (dw)
; qword - 64 bit (dq) WORK ONLY IF 64 bit building (ELF64)

_start: ; Function(like main)
    mov rax, 4 ; register accumulator set to 4, 4 - writing
    mov rbx, 1 ; 1 - stdout
    mov rcx, msg ; send message start address to rcx 
    mov rdx, len ; finish of reg message
    int 0x80
    call exit ; Execute procedure exit


exit: ; our custom procedure
    mov rax, 1 ; send 1 to reg(exit)
    mov rbx, 0 ; 0 - return code(0 - no errors)
    int 0x80 ; req to operating system to confirm actions of changed regs


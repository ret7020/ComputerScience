format ELF64 ; binary format ELF(for linux) with 64 bit architecture
public _start ; program start procedure

_start: ; Function(like main)
    call exit ; Execute procedure exit

exit: ; our custom procedure
    mov rax, 1 ; send 1 to reg(exit)
    mov rbx, 12 ; 0 - return code(0 - no errors)
    int 0x80 ; req to operating system to confirm actions of changed regs


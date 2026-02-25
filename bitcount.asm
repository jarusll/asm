BITS 32

SECTION .data
number dd 200

SECTION .text
GLOBAL _start
_start:
    push dword [number]
    call count_bits
    pop ebx
    push eax
    jmp exit

count_bits:
    push ebp
    mov ebp, esp
    mov ebx, [ebp + 8] ; get the argument from stack
    jmp count_loop
    mov eax, 0

count_loop:
    cmp ebx, 0
    jz end_count
    shr ebx, 1
    jnc count_loop
    inc eax
    jmp count_loop

end_count:
    leave
    ret

exit:
    mov eax, 1
    pop ebx
    int 0x80

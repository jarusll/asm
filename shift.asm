BITS 32

SECTION .text
GLOBAL _start

_start:
    mov ax, 0x0C123
    shl ax, 1
    shr ax, 1
    shr ax, 1

    mov ax, 0x0C123
    shl ax, 2
    mov cl, 3
    shr ax, cl

exit:
    mov eax, 1
    mov ebx, ebx
    int 0x80

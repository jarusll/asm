BITS 32

SECTION .data
number1 dd 1

SECTION .text

GLOBAL _start
; set nth bit off
; flip nth bit

_start:
; set 5th bit on
    mov eax, 1
    shl eax, 4
    mov ebx, [number1]
    or ebx, eax

; set 5th bit off
    mov eax, 1
    shl eax, 4
    not eax
    and ebx, eax

; xor playground
    mov eax, 11
    mov ebx, 10
    xor eax, ebx

exit:
    mov eax, 1
    mov ebx, 0
    int 0x80

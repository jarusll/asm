.intel_syntax noprefix
.section .data

.section .text

.globl _start

_start:
    mov eax, 1 # exit syscall
    mov ebx, 0 # with 0 status code
    int 0x80

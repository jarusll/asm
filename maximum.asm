.intel_syntax noprefix
.section .data
numbers: .long 1, 2, 3, 4, 5, 6, 7, 8, 9, 0

.section .text

.globl _start

_start:
    mov ebx, [numbers]
    mov edi, 0
    jmp loop

loop:
    mov eax, [numbers + edi * 4]
    cmp eax, 0
    je exit
    mov eax, [numbers + edi * 4]
    cmp eax, ebx
    jg maximum
    add edi, 1
    jmp loop

maximum:
    mov ebx, [numbers + edi * 4]
    add edi, 1
    jmp loop

exit:
    mov eax, 1
    # use maximum number for return status code, already present in ebx
    int 0x80

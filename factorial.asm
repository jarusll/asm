BITS 32
GLOBAL _start

SECTION .text

_start:
    push 4 ; argument
    call factorial
    add esp, 4 ; cleanup pushed decimal 4
    mov ebx, eax
    jmp exit

; Input - Number on stack
; Output - eax
; Note - argument >= 1
factorial:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8] ; Move arg to ebx
    cmp eax, 1
    je end_factorial
    sub eax, 1
    push eax
    call factorial
    mov ebx, [ebp + 8] ; get the argument again
    imul eax, ebx ; multiply by result of line-2 factorial

end_factorial:
    mov esp, ebp
    pop ebp
    ret

exit:
    mov eax, 1
    int 0x80

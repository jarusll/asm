BITS 32
GLOBAL _start

SECTION .text

_start:
    push 3
    push 3
    call power
    add esp, 8
    mov ebx, eax
    jmp exit

exit:
    mov eax, 1
    mov ebx, ebx
    int 0x80

; Input - Number and Power
; Output - Number raised to Power
; Note - Power must be >= 1
power:
    push ebp
    mov ebp, esp
    sub esp, 4
    mov ebx, [ebp + 8] ; first arg
    mov ecx, [ebp + 12] ; second arg
    mov [ebp - 4], ebx
    mov eax, ebx
    jmp power_loop

power_loop:
    cmp ecx, 1
    je end_loop
    imul eax, ebx
    mov [ebp - 4], eax
    sub ecx, 1
    jmp power_loop

end_loop:
    mov eax, [ebp - 4]
    mov esp, ebp
    pop ebp
    ret

BITS 32

SECTION .data
number dd 3

SECTION .text
GLOBAL _start
_start:
    push dword [number]
    call prime
    push eax
    jmp exit

; Prime function that expects a argument and returns 1 | 0 in eax
prime:
    push ebp
    mov ebp, esp
    sub esp, 4
    mov ebx, dword [ebp + 8] ; arg into ebx
    mov ecx, 2 ; consider < 2 to be primes
    jmp prime_loop

prime_loop:
    cmp ebx, ecx
    je not_found_prime
    ; setup up edx:eax division
    xor edx, edx
    mov eax, ebx
    div ecx
    cmp edx, 0
    je found_prime
    inc ecx
    jmp prime_loop

found_prime:
    mov eax, 1
    jmp end_prime

not_found_prime:
    mov eax, 0
    jmp end_prime

end_prime:
    add esp, 4
    leave
    ret

exit:
    mov eax, 1
    pop ebx
    int 0x80

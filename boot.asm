BITS 16

org 0x7C00

GLOBAL _start

SECTION .text
_start:
    ; Set video mode to 40x25 text mode
    xor ah, ah
    mov al, 0
    int 0x10
    ; move cursor to row 10, column 10
    mov ah, 0x02
    mov dh, 11
    mov dl, 12
    mov bh, 0
    int 0x10

    ; segments setup
    mov ax, cs
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00
    ; point ds to cs
    mov ds, ax
    mov si, string
print:
    ; print string to screen
    mov ah, 0x0E
    mov bl, 0
    ; load ds:si to al
    lodsb
    cmp al, 0
    jz done
    int 0x10
    jmp print

done:
    jmp $

string: db "Hello, World!", 0

padding:
    ; padding
    times 510 - ($ - $$) db 0
    ; boot signature
    dw 0xAA55


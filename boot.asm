BITS 16

org 0x7C00

GLOBAL _start

SECTION .text

_start:
    jmp $
    times 510 - ($ - $$) db 0
    dw 0xAA55

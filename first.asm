; file: first.asm
; First assembly program. This program asks for two integers as
; input and prints out their sum.
;
; To create executable using djgpp:
; nasm -f coff first.asm
; gcc -o first first.o driver.c asm_io.o
%include "asm_io.inc"


; initialized data is put in the .data segment
SEGMENT .data

; These labels refer to strings used for output
prompt1 db "Enter a number: ", 0
; don’t forget null terminator
prompt2 db "Enter another number: ", 0
outmsg1 db "You entered ", 0
outmsg2 db " and ", 0
outmsg3 db ", the sum of these is ", 0

; uninitialized data is put in the .bss segment
segment .bss
; These labels refer to double words used to store the inputs


input1 resd 1
input2 resd 1

; code is put in the .text segment
SEGMENT .text
GLOBAL _asm_main

_asm_main:
enter 0,0
; setup routine
pusha
mov eax, prompt1
call print_string; print out prompt

call read_int
[input1], eax; read integer
; store into input1

mov eax, prompt2
call print_string; print out prompt
call read_int
[input2], eax; read integer
; store into input2
mov
add
moveax, [input1]
eax, [input2]
ebx, eax; eax = dword at input1
; eax += dword at input2
; ebx = eax
dump_regs 1
dump_mem 2, outmsg1, 1
; print out register values
; print out memory
;
; next print out result message as series of steps
;
mov
eax, outmsg1
call
print_string
; print out first message
mov
eax, [input1]
call
print_int
; print out input1
mov
eax, outmsg2
call
print_string
; print out second message
mov
eax, [input2]
call
print_int
; print out input2
mov
eax, outmsg3

call
mov
call
call
21
print_string
eax, ebx
print_int
print_nl
; print out third message
; print out sum (ebx)
; print new-line
eax, 0; return back to C
popa
mov
leave
ret

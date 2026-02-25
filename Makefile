exit: exit.asm
	as exit.asm -o exit.o
	ld exit.o -o exit
	./exit

maximum: maximum.asm
	as maximum.asm -o maximum.o
	ld maximum.o -o maximum
	./maximum

power: power.asm
	nasm -f elf32 -g -F dwarf power.asm -o power.o
	ld -m elf_i386 -g power.o -o power
	./power

factorial: factorial.asm
	nasm -f elf32 factorial.asm -o factorial.o
	ld -m elf_i386 factorial.o -o factorial
	./factorial

boot: boot.asm
	nasm -f bin boot.asm -o boot.bin
	qemu-system-i386 -hda boot.bin

driver.o: driver.c
	gcc -c driver.c -o driver.o

driver: driver.o first.asm
	nasm -f coff first.asm
	gcc -o first first.o driver.o asm_io.o

prime: prime.asm
	nasm -f elf32 -g -F dwarf prime.asm -o prime.o
	ld -m elf_i386 prime.o -o prime
	./prime

shift: shift.asm
	nasm -f elf32 -g -F dwarf shift.asm -o shift.o
	ld -m elf_i386 shift.o -o shift
	./shift

bitcount: bitcount.asm
	nasm -f elf32 -g -F dwarf bitcount.asm -o bitcount.o
	ld -m elf_i386 bitcount.o -o bitcount
	./bitcount

bitops: bitops.asm
	nasm -f elf32 -g -F dwarf bitops.asm -o bitops.o
	ld -m elf_i386 bitops.o -o bitops
	./bitops

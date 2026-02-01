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

all: fibonacci

fibonacci: fibonacci.o
	gcc -m64 -o fibonacci fibonacci.o -lc -no-pie

fibonacci.o: fibonacci.asm
	nasm -f elf64 -o fibonacci.o fibonacci.asm

clean:
	rm -f fibonacci.o fibonacci
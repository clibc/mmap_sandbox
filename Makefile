main:main.c
	gcc -ggdb -Wall -std=c99 -Wextra main.c

simple:simple.asm
	nasm -o simple.o simple.asm

clean:
	rm -f *.o
	rm -f *.core

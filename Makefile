main:main.c
	gcc -ggdb -Wall -Wextra -pedantic -std=c99 main.c

simple:simple.asm
	nasm -o simple.o simple.asm

clean:
	rm -f *.o
	rm -f *.out
	rm -f *.core

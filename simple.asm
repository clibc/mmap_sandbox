	BITS 64
	%define SYS_WRITE 4
	%define STDOUT 1
	%define SYS_EXIT 1
	
	global _start
	segment .text
	_start:
	mov rax, SYS_WRITE
	mov rdi, STDOUT
	lea rsi, [rel hello]
	mov rdx, hello_size
	syscall 
	ret
	
	segment .data
	hello:db "Hello World",10
	hello_size:	equ $-hello

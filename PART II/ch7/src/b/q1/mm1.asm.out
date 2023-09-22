
extern printf
section .text
global main
main:
	push msg
	call printf
	add esp,4
	
	push msg
	call printf
	add esp,4
	
	xor eax,eax
	ret
	
section .data
	msg db 'haha ',0
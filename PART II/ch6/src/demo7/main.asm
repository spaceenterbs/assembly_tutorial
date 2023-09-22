; 32bit mode
section .text
global _main
extern _printf
extern _myadd
_main:
	
	push dword [b]
	push dword [a]	
	call _myadd
	mov [total], eax
	add esp,8
	
	push dword [total]
	push msg
	call _printf
	add esp,8
	
	ret
section .data
	msg db "total:%d",0
	total dd 0
	a     dd 3
	b     dd 5
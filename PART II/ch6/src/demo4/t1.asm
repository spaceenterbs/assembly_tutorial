; 32bit mode 
extern _printf

section .text
global _main
_main:
    push  msg1
    call _printf
    add esp,4    

	push dword [my]	
	push msg2
	call _printf
	add esp,4+4
	
    ret
section .data
    msg1 db 'hello',13,10,0    
	msg2 db "para:<%d>",0
    my   dd 45,1,2,3
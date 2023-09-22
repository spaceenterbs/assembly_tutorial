section .text
global main
main:

	; create the file 
	mov eax,8
	mov ebx,destfile
	mov ecx,0777o
	int 0x80
	mov [did],eax
		
	; close the file
	mov eax,6
	mov ebx,[did]
	int 0x80
	
	ret
	
section .data
	destfile   db 'demo.txt.out',0
	
section .bss
	did resd 1


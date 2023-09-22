section .text
global main
main:
    ; open source file
	mov eax,5
	mov ebx,sourcefile
	mov ecx,0
	mov edx,0777o 
	int 0x80
	mov [sid], eax
	
	
	; close 
	mov eax,6
	mov ebx,[sid]
	int 0x80
	
	ret
	
section .data
	sourcefile db 'demo.txt',0
	
section .bss
	sid resd 1


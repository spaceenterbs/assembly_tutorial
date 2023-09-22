	org 100h
	
section .text
	mov ah,9
	mov dx,hello
	int 21h
	
	mov ah,10h
	int 16h
	
	
	
	mov ah,4ch
	mov al,0
	int 21h
	
section .data
	hello: db 'hello, world!',13,10,'$'
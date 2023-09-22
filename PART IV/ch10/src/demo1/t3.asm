
; hello.asm
; Compile in Windows
; nasm -f obj -o hello.obj hello.asm
; link in DOSBox / MS DOS
; val hello.obj,hello.exe,,,

BITS 16

segment code

..start:
	mov ax,data

	mov ds,ax
	mov ax,stack
	mov ss,ax
	mov sp,stacktop

	mov dx,hello
	mov ah,9
	int 0x21

	mov ax,0x4c00
	int 0x21

segment data

hello: db 'Hello World', 13, 10, '$'

segment stack stack
	resb 64
	stacktop:

; nasm -f win32 -o t1.obj t1.asm
; golink /entry start /fo t1.exe t1.obj user32.dll

extern MessageBoxA

section .text
global start
start:
	mov eax,0
	mov ebx,1
	 
		
	xor eax,eax
	ret 


section .data
	caption db 'My App',0
	msg     db 'Hello, world',0
	
section  .bss
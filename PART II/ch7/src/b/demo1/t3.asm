; nasm -f win32 -o t1.obj t1.asm
; golink /entry start /fo t1.exe t1.obj kernel32.dll ; user32.dll 


extern MessageBoxA 
extern printf

section .text
global main
main:
	PUSH    0x40
    PUSH    paramTitle
    PUSH    paramText
    PUSH    0x0    
    CALL    MessageBoxA

	; print('haha')
	push paramText
	call printf
	add esp,4
	
	
	xor eax,eax
	ret 


section .data
paramText   DB  "Text!", 0
paramTitle  DB  "Title", 0

section .bss
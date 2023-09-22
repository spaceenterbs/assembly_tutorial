
; nasm -f win32 -o t1.obj t1.asm
; golink /entry start /fo t1.exe t1.obj user32.dll

extern MessageBoxA

section .text
global start
start:
	
	; MessageBoxA(NULL,msg,caption,0x40)
	push 0x40    ; MB_OK | MB_ICONINFORMATION (uType)
	push caption ; caption (lpCaption)
	push msg     ; msg  (lpText)
	push 0x00    ; NULL (hWnd)
	call MessageBoxA
    mov [reval],eax 	
		
	xor eax,eax
	ret 


section .data
	caption db 'My App',0
	msg     db 'Hello, world',0
	
section  .bss
	reval   resd  1
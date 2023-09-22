; nasm -f win32 -o t1.obj t1.asm
; golink /entry start /fo t1.exe t1.obj kernel32.dll ; user32.dll 


extern	GetCommandLineA
extern	GetModuleHandleA
extern	ExitProcess

section .text
global start
start:
	push	3		
	call	GetCommandLineA	

	push	eax		
	xor	eax, eax
	push	eax		
	push	eax
	call	GetModuleHandleA

	push	eax		
	call	WinMain	

exit:

	push	eax	
	call	ExitProcess

	xor eax,eax
	ret
	
WinMain:

	xor eax,eax
	ret 


section .data

section .bss
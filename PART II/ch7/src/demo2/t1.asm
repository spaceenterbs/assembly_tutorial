; nasm -f win32 -o t1.obj t1.asm
; golink /entry start /fo t1.exe t1.obj kernel32.dll

extern CreateFileA
extern CloseHandle
section .text
global start
start:

	push 0
	push 0x80 ; FILE_ATTRIBUTE_NORMAL
	push 0x01 ; CREATE_NEW
	push 0
	push 0x00
	push 0x02 ; GENERIC_WRITE
	push fileName
	call CreateFileA
	mov [hFile], eax
	
	cmp eax,-1
	jne start_end
	; PrintError
	
start_end:		
	mov eax,[hFile]
	push eax
	call CloseHandle
		
	xor eax,eax
	ret 

section .data
	fileName db 'my.txt',0
	
section  .bss
	hFile resd 1
	
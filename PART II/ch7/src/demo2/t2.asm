; nasm -f win32 -o t1.obj t1.asm
; golink /entry start /fo t1.exe t1.obj kernel32.dll

extern CreateFileA
extern CloseHandle
extern WriteFile

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
	mov [fileHandle], eax
	
	cmp eax,-1
	jne start_end
	mov [retval],eax	
start_end:		
	
	push 0
	push dwBytesWritten
	push msg_len
	push msg
	mov eax,[fileHandle]
	push eax	
	call WriteFile

	mov eax,[fileHandle]
	push eax
	call CloseHandle
		
	xor eax,eax
	ret 

section .data
	fileName db 'My.txt',0
	msg      db 'I love you',0
	msg_len  equ $ - msg
	
section  .bss
	fileHandle resd 1
	retval     resd 1
	dwBytesWritten resd 1
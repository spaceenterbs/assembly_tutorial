; nasm -f win32 -o t1.obj t1.asm
; golink /entry start /fo t1.exe t1.obj kernel32.dll

extern CreateFileA
extern CloseHandle
extern WriteFile
extern ReadFile
extern MessageBoxA
 

BLOCK_SIZE equ  10

section .text
global start
;----------------------------
;  start()
;---------------------------	
start:
	
	push msg1
	call MyMsgBox	
	
	call MyOpenFile
	
	call MyCopyFile	

	call MyCloseHandle
	
	push msg2
	call MyMsgBox	
	
	xor eax,eax
	ret
;----------------------------
;  MyCopyFile()
;---------------------------	
MyCopyFile:

mycopyfile_start:
	
	push 0
	push dwNumberOfBytes
	push BLOCK_SIZE
	push Buffer
	mov eax,[hrFile]
	push eax	
	call ReadFile
	
	mov eax,[dwNumberOfBytes]
	cmp eax,0
	je mycopyfile_end
	
	push 0
	push dwBytesWritten	
	mov eax, [dwNumberOfBytes]	
	push eax	
	push Buffer	
	mov eax,[hwFile]
	push eax	
	call WriteFile
	jmp mycopyfile_start
	
mycopyfile_end:	
	ret
;----------------------------
;  MyOpenFile()
;---------------------------		
MyOpenFile:
	push 0
	push 0x80 ; FILE_ATTRIBUTE_NORMAL
	push 0x03 ; OPEN_EXISTING
	push 0
	push 0x00
	push 0x01 ; GENERIC_READ
	push rfileName
	call CreateFileA
	mov [hrFile], eax

	push 0
	push 0x80 ; FILE_ATTRIBUTE_NORMAL
	push 0x01 ; CREATE_NEW
	push 0
	push 0x00
	push 0x02 ; GENERIC_WRITE
	push wfileName
	call CreateFileA
	mov [hwFile], eax
	
	ret
;----------------------------
;  MyCloseHandle()
;---------------------------		
MyCloseHandle:	
	mov eax,[hwFile]
	push eax
	call CloseHandle
	
	mov eax,[hrFile]
	push eax
	call CloseHandle
	
	ret 
;----------------------------
;  void __stdcall MyMsgBox(msg)
;---------------------------
MyMsgBox:
	
	mov ebp, esp
	push ebp 
	
	push 0x40    ; MB_OK | MB_ICONINFORMATION (uType)
	push caption ; caption (lpCaption)	
	push dword [ebp+4]     ;    (lpText)	
	push 0x00    ; NULL (hWnd)
	call MessageBoxA
	
    pop ebp	
	ret 4


section .data
	rfileName db 'mm1.asm',0
	wfileName db 'mm1.asm.out',0	
	caption   db 'clcc message',0
	msg1      db 'start copy !',0
	msg2      db 'end copy!',0
	
section  .bss
	hrFile          resd 1
	hwFile          resd 1
	dwBytesWritten  resd 1
	dwNumberOfBytes resd 1
	Buffer          resb BLOCK_SIZE+1
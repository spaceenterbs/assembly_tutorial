;
; WinMain.asm
; 06/23/2014
;
; Assembler:	NASM version 2.11.05 compiled on May 21 2014
; Linker:	GoLink.Exe Version 1.0.0.0
;
; nasm -fwin32 -oWinMain.obj WinMain.asm
; golink /entry start /fo WinMain.exe WinMain.obj kernel32.dll user32.dll 
;

cpu	386

global	start

extern	GetCommandLineW
extern	GetModuleHandleW
extern	ExitProcess

extern MessageBoxA
extern CreateFileA
extern CloseHandle


SEGMENT .DATA

paramText   DB  "Text!", 0
paramTitle  DB  "Title", 0
fileName    db  "my1.txt",0
msg         db  '1234',0
msg_len     equ $ - msg 



section .bss
my	resd 1
myre resd 10 

[SECTION .code use32]

start:

	push	3		; nCmdShow SW_MAXIMIZE   who needs this argument????????

	call	GetCommandLineW	; win32 API

	push	eax		; lpCmdLine

	xor	eax, eax
	push	eax		; hPrev   nobody need this argument.

	push	eax
	call	GetModuleHandleW; win32 API

	push	eax		; hInst

	call	WinMain		; call WinMain with 4 arguments on the stack

exit:

	push	eax		; error code
	call	ExitProcess	; win32 API




; WinMain(HINSTANCE hInst, HINSTANCE hPrev, LPSTR lpCmdLine, int nCmdShow)
extern WriteFile

WinMain:

	; do some useful things hereG
	; MessageBoxA()
	PUSH    0x44
    PUSH    paramTitle
    PUSH    paramText
    PUSH    0x0    
    CALL    MessageBoxA
	
	;CreateFileA(fileName,GENERIC_WRITE,0,NULL,OPEN_EXITING,FILE_ATTRIBUTE_NORMAL,NULL)
	push 0x0
	push 0x80
	push 0x4
	push 0x0
	push 0x0	
	push 0x00000003
	push fileName
	call CreateFileA	
	mov [my],eax
	
	; WriteFile(hFile,buf,len,&dwWritten,NULL)
	push 0x0
	push myre
	push msg_len
	push msg
	push dword [my]
	call WriteFile
	
	;CloseHandle(my)
	mov ebx ,[my]
	push ebx
	call CloseHandle
	
	
	PUSH    0x40
    PUSH    paramTitle
    PUSH    paramText
    PUSH    0x0    
    CALL    MessageBoxA

	xor eax, eax	; return 0, everything went well

ret 16	; restore the stack, pop 4 argumentst

;=======================================================
LAB1:

   PUSH 0; hTemplateFile not used
   PUSH 0; file attributes and flags   -  none
   PUSH 2; how to create  CREATE_ALWAYS
   PUSH 0; security structure not used
   PUSH 0; share mode, no sharing
   PUSH 0C0000000h; access mode  GENERIC_READ or GENERIC_WRITE
   PUSH offset my_file  
   CALL CreateFileA
   
   cmp eax,INVALID_HANDLE_VALUE
   je nogood

   mov hFile,eax; **************  save the file handle
 nogood:
	ret

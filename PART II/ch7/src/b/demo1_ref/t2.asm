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
fileName    db  "my.txt",0
fhandle     dd  0x0

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

WinMain:

	; do some useful things here
	PUSH    0x44
    PUSH    paramTitle
    PUSH    paramText
    PUSH    0x0    
    CALL    MessageBoxA
	
	
	push 0x0
	push 0x80
	push 0x4
	push 0x0
	push 0x0	
	push 0x00000003
	push fileName
	call CreateFileA
	;mov [fhandle],eax
	; WriteFile(hFile,buf,len,&dwWritten,NULL)
	
	;mov eax ,[fhandle]
	push eax
	call CloseHandle
	
	
	PUSH    0x40
    PUSH    paramTitle
    PUSH    paramText
    PUSH    0x0    
    CALL    MessageBoxA

	xor eax, eax	; return 0, everything went well
    ret 16	; restore the stack, pop 4 argumentst
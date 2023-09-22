; File: Win32MessageBox.asm
; Version: 1.2
; Author: Max
; Date: 6/23/2014
;
; --------------------------------------------------------
; - A very simple Win32API call to create a message box. -
; --------------------------------------------------------
;
; Compile with:
; nasm -fwin32 Win32MessageBox.asm
; gcc Win32MessageBox.obj -o Win32MessageBox.exe
;
; C-Style Code
; **
; * #include <windows.h>
; * 
; * int WINAPI
; * WinMain(HINSTANCE hInst, HINSTANCE hPrev, LPSTR lpCmdLine, int nCmdShow)
; * {
; *     MessageBox
; *     (
; *         NULL,
; *         "Text!",
; *         "Title",
; *         MB_ICONINFORMATION | MB_OK
; *     );
; * 
; *     return 0;
; * }
; **

[BITS 32]

EXTERN _MessageBoxA@16   ; user32.dll 
;extern _CreateFileA@16   ; kernel32.dll 
EXTERN _DrawTextW@16

;http://www.bogotobogo.com/Win32API/Win32API_Calling_Convention__cdecl__fastcall__stdcall.php 
SEGMENT .DATA

paramText   DB  "Text!", 0
paramTitle  DB  "Title", 0
fileName    db  "my.txt",0

SEGMENT .TEXT
    GLOBAL _WinMain@16
_WinMain@16:
    PUSH    EBP
    MOV     EBP,    ESP
    
    ; http://msdn.microsoft.com/en-us/library/ms645505.aspx
    ;       0x00000040 = MB_ICONINFORMATION
    ; OR    0x00000000 = MB_OK
    ; =====================================
    ;       0x00000040
    PUSH    0x44
    PUSH    paramTitle
    PUSH    paramText
    PUSH    0x0
    
    CALL    _MessageBoxA@16
	
	PUSH    0x41
    PUSH    paramTitle
    PUSH    paramText
    PUSH    0x0
    
    CALL    _MessageBoxA@16
	
	; CreateFile("my.text",GENERIC_WRITE,0,NULL,CREATE_ALWAYS,FILE_ATTRIBUT_NORMAL,NULL)
	
    push 0x0
	push 0x80
	push 0x4
	push 0x0
	push 0x0	
	;push 0x00000003
	;push fileName
	;call _CreateFileA@16
	 
	
	
	
    XOR     EAX,    EAX
    LEAVE
    
    ; _WinMain@16 follows __stdcall, so
    ; 16 bytes of parameters (see mangled name) must
    ; be popped
    RET     0x10
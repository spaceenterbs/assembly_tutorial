; Compile with:
; nasm -fwin32 MessageBoxTest.asm
; gcc MessageBoxTest.obj -o MessageBoxTest.exe

[BITS 64]

EXTERN _MessageBoxA@16

SEGMENT .TEXT
    GLOBAL _WinMain@16
_WinMain@16:
    ;PUSH    EBP
	push rbp
    ;MOV     EBP,    ESP
	mov rbp, rsp
    
    ;MOV     EAX,    [EBP + 16]
	mov rax,[rbp + 16]
    PUSH    0x0
    ;PUSH    EAX
	push rax
    ;PUSH    EAX
	push rax
    PUSH    0x0
    
    CALL    _MessageBoxA@16
    
    ;XOR     EAX,    EAX
	xor rax,rax
    LEAVE
    RET     0x10
; Compile with:
; nasm -fwin32 MessageBoxTest.asm
; gcc MessageBoxTest.obj -o MessageBoxTest.exe

[BITS 32]

EXTERN _MessageBoxA@16

SEGMENT .TEXT
    GLOBAL _WinMain@16
_WinMain@16:
    PUSH    EBP
    MOV     EBP,    ESP
    
    MOV     EAX,    [EBP + 16]
    PUSH    0x0
    PUSH    EAX
    PUSH    EAX
    PUSH    0x0
    
    CALL    _MessageBoxA@16
    
    XOR     EAX,    EAX
    LEAVE
    RET     0x10
%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    
    mov eax,33
    mov ebx,22
    
    ;MyAdd(eax,ebx)
    push ebx
    push eax
    call MyAdd
    
    PRINT_DEC 4,eax
    NEWLINE
    
    ;MySub(3,7)
    push dword 7
    push dword 3
    call MySub
    add esp,8
    
    PRINT_DEC 4,eax
    NEWLINE
        
       
    xor eax, eax
    ret

;----------------------------
; eax  __cdecl MySub(int a,int b)
;----------------------------    
MySub:
    push ebp
    mov ebp,esp 
    
    mov eax,[ebp+8]   ; a
    mov ebx,[ebp+8+4] ; b
    sub eax,ebx
    pop ebp
    ret

;----------------------------
; eax  __stdcall MyAdd(int a,int b)
;----------------------------    
MyAdd:
    push ebp
    mov ebp,esp 
    
    mov eax,[ebp+8]   ;a
    mov ebx,[ebp+8+4] ;b
    add eax,ebx
    pop ebp
    
    ret 8
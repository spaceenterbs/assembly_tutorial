%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    ;write your code here
     
    ; input
    PRINT_STRING msg1
    GET_DEC 2,mya    
    PRINT_DEC 2,mya
    NEWLINE
    
    PRINT_STRING msg1
    GET_DEC 2,myb    
    PRINT_DEC 2,myb
    NEWLINE
    
    ; calculation
    
    ; + 
    mov ax,[mya]
    mov bx,[myb]
    add ax,bx  ; ax = ax + bx
    mov [a],ax
    
    ; - 
    mov ax,[mya]
    mov bx,[myb]
    sub ax,bx ; ax = ax - bx
    mov [b],ax
    
    ; * 
    mov ax,[mya]
    mov bx,[myb]
    mul bx    ; dx:ax = ax * bx
    mov [c],ax
    ;mov eax,dx*16+ax
    
    ; / 
    mov ax,[mya]
    mov bx,[myb]
    mov dx,0
    div bx    ; dx:ax / bx   => ¸ò: ax   , ³ª¸ÓÁö: dx
    mov [d],ax
    mov [e],dx
    
    ; output
    PRINT_STRING msg2
    PRINT_DEC 2,a
    NEWLINE
    
    PRINT_STRING msg3
    PRINT_DEC 2,b
    NEWLINE 
    
    PRINT_STRING msg4
    PRINT_DEC 2,c
    NEWLINE
    
    PRINT_STRING msg5
    PRINT_DEC 2,d
    NEWLINE
    
    PRINT_STRING msg6
    PRINT_DEC 2,e
    NEWLINE
        
    ;return 0
    xor rax, rax
    ret
    
section .data
    msg1 db 'input data:',0x00
    msg2 db '+:',0x00
    msg3 db '-:',0x00
    msg4 db '*:',0x00
    msg5 db '/(q):',0x00
    msg6 db '/(r):',0x00
    
section .bss
    mya resw 1 ; input1
    myb resw 1 ; input2
    a resw 1   ; +
    b resw 1   ; -
    c resw 1   ; *
    d resw 1   ; / (¸ò)
    e resw 1   ; / (³ª¸ÓÁö)
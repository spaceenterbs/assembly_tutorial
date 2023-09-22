%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    ;write your code here
     
    ; input
    PRINT_STRING msg1
    GET_DEC 1,mya    
    PRINT_DEC 1,mya
    NEWLINE
    
    PRINT_STRING msg1
    GET_DEC 1,myb    
    PRINT_DEC 1,myb
    NEWLINE
    
    ; calculation
    
    ; + 
    mov al,[mya]
    mov bl,[myb]
    add al,bl  ; al = al + bl
    mov [a],al
    
    ; - 
    mov al,[mya]
    mov bl,[myb]
    sub al,bl ; al = al - bl
    mov [b],al
    
    ; * 
    mov al,[mya]
    mov bl,[myb]
    mul bl    ; ax = al * bl
    mov [c],ax
     
    
    ; / 
    mov ax,0
    mov al,[mya]
    mov bl,[myb]
    div bl    ; ax / bl   => ¸ò: al   , ³ª¸ÓÁö: ah
    mov [d],al
    mov [e],ah
    
    ; output
    PRINT_STRING msg2
    PRINT_DEC 1,a
    NEWLINE
    
    PRINT_STRING msg3
    PRINT_DEC 1,b
    NEWLINE 
    
    PRINT_STRING msg4
    PRINT_DEC 2,c
    NEWLINE
    
    PRINT_STRING msg5
    PRINT_DEC 1,d
    NEWLINE
    
    PRINT_STRING msg6
    PRINT_DEC 1,e
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
    mya resb 1 ; input1
    myb resb 1 ; input2
    a resb 1   ; +
    b resb 1   ; -
    c resw 1   ; *
    d resb 1   ; / (¸ò)
    e resb 1   ; / (³ª¸ÓÁö)
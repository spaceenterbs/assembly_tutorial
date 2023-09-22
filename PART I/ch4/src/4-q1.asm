%include "io64.inc"

section .text
global CMAIN
CMAIN:   
    ;write your code here
    ; input max number
    PRINT_STRING msg_input
    GET_DEC 2,data_max
    NEWLINE
        
    ; check 3's multiple 
    mov [data_size],word 0
    mov edx,1 ; index: edx 1 ~ 100
L1:  ; AX/8bit = AL (³ª¸ÓÁö)
    mov bl,3
    mov ax,dx
    div bl
    cmp ah,0
    jnz L_next
    mov eax,0
    mov ax,[data_size]
    mov [data + eax*2],dx    
    inc eax
    mov [data_size],ax
L_next:
    inc edx
    cmp dx,[data_max]
    jle L1
        
    ; print number 
    PRINT_STRING msg_count
    PRINT_DEC 2,[data_size]
    NEWLINE        
    mov eax,0
L_print:
    PRINT_DEC 2,[data + eax*2]
    NEWLINE    
    inc eax
    cmp ax,word [data_size]
    jl L_print
    
    ;get totoal
    mov word[total],0
    mov ecx,0
    mov cx,[data_size]
    mov eax,0
    mov ebx,0
L_total:
    add ebx,[data + eax*2]
    inc eax
    loop L_total    
    mov [total],ebx
    
    PRINT_STRING msg_total
    PRINT_DEC 2,total
    NEWLINE
     
    xor rax, rax
    ret
section .data
    msg_input db '# input max number:',0x00
    msg_count db '# number count:',0x00
    msg_total db '# total:',0x00
    
section .bss
    data_max resw 1
    data_size resw 1     
    data resw 100
    total resw 1

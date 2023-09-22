%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    PRINT_STRING input_msg
    GET_DEC 2,a    
    NEWLINE        
    PRINT_STRING input_msg
    GET_DEC 2,b    
    NEWLINE    
    PRINT_STRING input_msg
    GET_DEC 2,c
    NEWLINE
    
    mov ax,[a]
    mov bx,[b]
    cmp ax,bx
    jg L_big
    mov cx,bx
    jmp L_big_end
L_big:
    mov cx,ax
L_big_end:

    mov ax,[c]
    cmp ax,cx
    jg L_big1
    mov [max],cx
    jmp L_big1_end
L_big1:
    mov [max],ax
L_big1_end:

    mov ax,[a]
    mov bx,[b]
    cmp ax,bx
    jl L_less
    mov cx,bx
    jmp L_less_end
L_less:
    mov cx,ax
L_less_end:

    mov ax,[c]
    cmp ax,cx
    jl L_less1
    mov [min],cx
    jmp L_less1_end
L_less1:
    mov [min],ax
L_less1_end:
                      
    PRINT_STRING max_msg                  
    PRINT_DEC 2,max
    NEWLINE
    PRINT_STRING min_msg
    PRINT_DEC 2,min
    NEWLINE

    mov ax,[max]
    mov bx,[min]
    mul bx    
    shl edx,16
    and eax,0x0000ffff
    or eax,edx    
    mov [total],eax
    
    PRINT_STRING total_msg
    PRINT_DEC 4,total
    NEWLINE
          
    xor rax, rax
    ret
section .data
    input_msg db 'input numbr:',0x00
    max_msg db 'max:',0x00
    min_msg db 'min:',0x00
    total_msg db 'max * min = ',0x00
    
section .bss
    a resw 1
    b resw 1
    c resw 1
    max resw 1
    min resw 1 
    total resd 1
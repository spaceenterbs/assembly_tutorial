%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov al,[a]   ; 1byte a의 저장값을 al 레지스터에 복사
    mov eax,a    ; a의 주소값을 eax(4byte) 레지스터에 복사
         
    mov [a],0x34      ; [error] 0x34 의 크기를 명시화 하지 않아서 발생 
    mov [a],byte 0x34 ; 0x34를 byte 단위로 규정함. (byte 0x34를 a 주소에 복사함)
    
    xor rax, rax
    ret
    
section .data
    a db 0x12
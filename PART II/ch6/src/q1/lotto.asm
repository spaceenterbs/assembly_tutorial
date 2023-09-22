; 32bit mode
%include "io.inc"

LOTTO_COUNT equ  6

section .text
global CMAIN
extern _getnumber
extern _inimylib
;----------------------------------------------
;  input:
;  return:
CMAIN:
    
	call _inimylib
	
	mov ecx,0
cmain_loop1:
	;PRINT_DEC 4,ecx
	;NEWLINE
	cmp ecx,LOTTO_COUNT
	jge cmain_end
	
	push ecx
	call _getnumber
	mov [a],eax
 	pop ecx
	
	push ecx
	mov ebx,ecx
	call CheckSame
	pop ecx	

	cmp eax,1
	je cmain_loop1	
	
	mov ebx,[a]
	mov [data+ecx*4],ebx
		
	inc ecx	
	jmp cmain_loop1
cmain_end:
	call ShowData
	
	ret
;-------------------------------------------
; 	input: eax(a), ebx(size)	
;   return: eax (0: not same , 1: find same)
CheckSame: 	
	mov edx,0	
	mov ecx,0
checksame_loop1:
	cmp ecx,ebx
	jge checksame_end
	cmp eax,[data+ecx*4]
	jne checksame_endif
	mov edx,1
	jmp checksame_end
checksame_endif:		
	inc ecx
	jmp checksame_loop1
checksame_end:
	mov eax,edx
	ret;
;-------------------------------------------
; 	input: 
;   return: 
ShowData:	
	PRINT_STRING msg1
	mov ecx,0
showdata_loop1:
	cmp ecx,LOTTO_COUNT
	jge show_end	
	push ecx
	PRINT_DEC 4, [data + ecx*4]	
	pop ecx
	cmp ecx,LOTTO_COUNT -1
	jge show_next
	push ecx
	PRINT_STRING msg2
	pop ecx
show_next:	
	inc ecx
	jmp showdata_loop1	
show_end:	
	ret
	
section .data
	msg1 db "Lotto:",0
	msg2 db ",",0
		
section .bss
 	a    resd 1
	data resd 6 



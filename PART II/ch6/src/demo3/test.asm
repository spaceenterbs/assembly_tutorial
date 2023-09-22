%include "io.inc"

section .text
global CMAIN
CMAIN:
	mov ax,0
	
	PRINT_STRING msg
	NEWLINE
		
	ret
	
section .data
	msg db 'haha',0
	
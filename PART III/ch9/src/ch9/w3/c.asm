section .text
global CMAIN
CMAIN:
	     ...
		; read 
		mov eax,3
		mov ebx,[sid]
		mov ecx,buffer
		mov edx,1
		int 0x80

        ;write
        mov eax,4
        mov ebx,[did]
        mov ecx,buffer
        mov edx,1
        int 0x80	
	
		...
		ret
section .data
		sid dd 
section .bss
		sid resd 1
		did resd 1
		buffer resb 20

section .text
	global main
	
main:
	pop eax
	pop ebx
	mov [para1],ebx
	pop ebx
	pop ecx
	pop edx
	
	mov eax,4
	mov ebx,1
	mov ecx,para1
	mov edx,4
	int 80h
	
	mov eax,1
	mov ebx,0
	int 80h
	
section .data
	msg db '12345',10
	para1 dd 0x12345678,0
	

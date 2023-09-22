section .text
global main
main:
	; print start msg
	mov eax,4
	mov ebx,1
	mov ecx,start_msg
	mov edx,start_msg_len
	int 0x80
	
	
    ; open source file
	mov eax,5
	mov ebx,sourcefile
	mov ecx,0
	mov edx,0777o 
	int 0x80
	mov [sid], eax
	
	; create the file 
	mov eax,8
	mov ebx,destfile
	mov ecx,0644o
	int 0x80
	mov [did],eax
	
	
	; copy    
copy_start:
	mov eax,3
	mov ebx,[sid]
	mov ecx,buffer
	mov edx,1
	int 0x80
    cmp eax,0x00
    je end_reading

    ;write
    mov eax,4
    mov ebx,[did]
    mov ecx,buffer
    mov edx,1
    int 0x80	
    jmp copy_start 
end_reading:

	; close 
	mov eax,6
	mov ebx,[sid]
	int 0x80
	
	mov eax,6
	mov ebx,[did]
	int 0x80
	
	
	; print end msg
	mov eax,4
	mov ebx,1
	mov ecx,end_msg
	mov edx,end_msg_len
	int 0x80
	ret
	
section .data
	sourcefile db 'demo.txt',0
	destfile   db 'demo.txt.out',0
	start_msg db 'start file copy',0
	start_msg_len equ $-start_msg
	end_msg db 'end file copy ',0
	end_msg_len equ $-end_msg
	
section .bss
	sid resd 1
	did resd 1
	buffer resb 20

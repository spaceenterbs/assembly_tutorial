; ---------------------------------------------------------------------------
; This is: Win64 Read File Into Memory Buffer (Win64 API, NASM, GCC, GoLink)
; Author: J.K. Encryptor256
; Date: October 27, 2013
; --------------------------------------------------------------------------- 
; Description:
; Read file into memory buffer, then display message box of  buffer contents.
; (Im not using any macros, so, everything should be clear and strightforward)
; --------------------------------------------------------------------------- 
; Procedures:
; 1. main
; 2. ReadFileIntoBuffer
; --------------------------------------------------------------------------- 
; Using:
;
; 1. The Netwide Assembler, NASM (http://nasm.us/)
;        The Netwide Assembler, NASM: It is an 80x86 and x86-64 assembler 
;        designed for portability and modularity.
; 
; 2. Minimalist GNU for Windows, MinGW64 (http://mingw-w64.sourceforge.net/)
;        Mingw-w64: It delivers runtime, headers and libs for developing
;        both, 64 bit (x64) and  32 bit (x86) windows applications, using GCC and 
;        other free software compilers.
;
;        GCC is a part of MINGW64 toolset.
;
; 3. GoLink, (http://www.godevtool.com/)
;
; ---------------------------------------------------------------------------
; How to compile:
;
; Like this, in the way i did:
;
; 1. NASM: "nasm.exe helloworld.asm -f win64 -o helloworld.obj"
; Output obj size: 1.54 KB (1,580 bytes)
;
; Choose your linker:
;
; 2.1. GCC: "gcc.exe helloworld.obj -m64 -o helloworld.exe"
; Output exe size: 45.2 KB (46,332 bytes)
;
; 2.2. GoLink: "golink.exe /entry main main.obj MSVCRT.dll kernel32.dll user32.dll"
; Output exe size: 2.00 KB (2,048 bytes), looks like some container size
;
; ---------------------------------------------------------------------------
 

ReadFileIntoBuffer:	; PROCEDURE
; ---------------------------------------------------------------------------
; Read file conents into a buffer
; ---------------------------------------------------------------------------
; Arg's:
; ---------------------------------------------------------------------------
; 1. address, of file name
; 2. address, where to store "address to data"
; 3. address, where to store "data len"
; ---------------------------------------------------------------------------
; Returns:
; ---------------------------------------------------------------------------
; OnSuccess: RAX equals 1.
; OnError: RAX equals 0.
; ---------------------------------------------------------------------------
; Description:
; ---------------------------------------------------------------------------
; A. When entering a function:
; 1. Save registers in home space
mov qword [rsp+8],rcx
mov qword [rsp+16],rdx
mov qword [rsp+24],r8
mov qword [rsp+32],r9
; 2. Allocate stack space for 4x default args
; 3. Allocate stack space for 3x local variables
sub rsp,qword 8*7
; ---------------------------------------------------------------------------
; Info:
; 1. Local variable nr. 1, at address [rsp+8*4], file handle
; 2. Local variable nr. 2, at address [rsp+8*5], file size
; 3. Local variable nr. 3, at address [rsp+8*6], buffer address
; ---------------------------------------------------------------------------
; B. When exiting a function:
; 1. De-Allocate stack space of 4x default args
; 2. De-Allocate stack space of 3x local variables
; ---------------------------------------------------------------------------
         
; Label	; Code	; Description
; 1. [fopen]	; Open target file
; 1.1. onerror: rax is 0	
; 1.2. onsuccess: save file handle into local variable nr. 1	
mov rdx,qword file_access_rb	
call fopen	; [1.]
cmp rax,qword 0	; [1.1.]
jne .openSuccess	
xor rax,rax	; OnError: RAX equals 0.
add rsp,qword 8*7	; [B.] Deallocate stack
ret	
.openSuccess:		
mov qword [rsp+8*4],rax	; [1.2.]
;  2. [fseek]	; Set file pointer to the end of file: SEEK_END
;  2.1. onsuccess: rax is 0	
;  2.2. onerror: [fclose]	; Close file handle, that were obtained at pt. 1.
mov r8,qword 2	
xor rdx,rdx	
mov rcx,rax	
call fseek	; [2.]
cmp rax,qword 0	; [2.1.]
je .fseekEnd	
mov rcx,qword [rsp+8*4]	
call fclose	; [2.2.]
xor rax,rax	
add rsp,qword 8*7	
ret	
.fseekEnd:		
; 3. [ftell]	; Get's File size
; 3.1. onerror: rax is -1	
; 3.2. onerror: [fclose]	
; 3.3. onsuccess: save file size into local variable nr. 2
mov rcx,qword [rsp+8*4]
call ftell	; [3.]
cmp rax,qword 0	; [3.1.]
jg .ftellSuccess	
mov rcx,qword [rsp+8*4]	
call fclose	; [3.2.]
xor rax,rax	
add rsp,qword 8*7	
ret	
.ftellSuccess:		
mov qword [rsp+8*5],rax	; [3.3.]
; 4. [fseek]	; Set file pointer to the start of file: SEEK_SET
; 4.1. onsuccess: rax is 0	
; 4.2. onerror: [fclose]	
mov r8,qword 0	
xor rdx,rdx	
mov rcx,qword [rsp+8*4]	
call fseek	; [4.]
cmp rax,qword 0	; [4.1.]
je .fseekSet	
mov rcx,qword [rsp+8*4]	
call fclose	; [4.2.]
xor rax,rax	
add rsp,qword 8*7	
ret	
.fseekSet:		
; 5. [malloc]	; Allocate buffer of file size, file size were obtained at pt. 3.
; 5.1. onerror: rax is 0	
; 5.2. onerror [fclose]	
; 5.3. onsuccess: save buffer address into local variable nr. 3	
mov rcx,qword [rsp+8*5]	
call malloc	; [5.]
cmp rax,qword 0	; [5.1.]
jne .mallocSuccessSZ	
mov rcx,qword [rsp+8*4]	
call fclose	; [5.2.]
xor rax,rax	
add rsp,qword 8*7	
ret	
.mallocSuccessSZ:		
mov qword [rsp+8*6],rax	; [5.3.]
; 6. [fread]	; Read data of file size in buffer address, that were obtained at pt. 5.
; 6.1. onsuccess: rax is equals to file size	
; 6.2. onerror: [free]	; Free allocated buffer address, that were obtained at pt. 5.
; 6.3. onerror: [fclose]	
mov r9,qword [rsp+8*4]	
mov r8,qword [rsp+8*5]	
mov rdx,qword 1	
mov rcx,rax	
call fread	; [6.]
cmp rax,qword [rsp+8*5]	; [6.1.]
je .freadSuccess	
mov rcx,qword [rsp+8*6]	
call free	; [6.2.]
mov rcx,qword [rsp+8*4]	
call fclose	; [6.3.]
xor rax,rax	
add rsp,qword 8*7	
ret	
.freadSuccess:		
; 7. Success	
; 7.1. Store allocated buffer address into arg nr. 2	
; 7.2. Store size of allocated buffer into arg nr. 3	
; 7.3. [fclose]	
mov rdx,qword [rsp+8*6]	
mov rax,qword [rsp+8*7+16]	
mov qword [rax],rdx	; [7.1.]
mov rdx,qword [rsp+8*5]	
mov rax,qword [rsp+8*7+24]	
mov qword [rax],rdx	; [7.2.]
mov rcx,qword [rsp+8*4]	
call fclose	; [7.3.]
mov rax,qword 1	; OnSuccess: RAX equals 1.
add rsp,qword 8*7	
ret
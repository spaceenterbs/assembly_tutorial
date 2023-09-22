	org 100h
	X_COUNT equ 0x8
	Y_COUNT equ 0x8
	MY_ENERGY equ '!'
	MY_PLAYER_CHR equ '@'
	
section .text
;--------------
; 프로그램의 메인 함수 
	
	call game_ini

	call game_run
	
	call my_exit
	
;---------------
; 사용자로부터 키 입력을 처리하는 서브루틴 
; in: (g_asccode,g_scancode)
; out: no
game_run:
	pusha
L_keyinput:	
		
	call game_check_energy
	call game_draw
	call my_getkey
	
	mov al,[g_asccode]
	cmp al,'q'
	je L_endgame
	
	mov al,[g_scancode]
	cmp al,0x4d
	je L_rightkey
	cmp al,0x4b
	je L_leftkey
	cmp al,0x48
	je L_upkey
	cmp al,0x50
	je L_downkey	
	jmp L_keyinput
		
L_upkey:
	dec byte [g_ypos]
	jmp L_keyinput
L_downkey:
	inc byte [g_ypos]
	jmp L_keyinput
L_rightkey:
	add [g_xpos],byte 1	
	jmp L_keyinput
L_leftkey:
	dec byte [g_xpos]	
	jmp L_keyinput
	
L_endgame:			
	popa
	ret	
;---------------
; 게임을 초기화 하는 서브루틴
; in: (g_xpos,g_ypos,g_score)
; out: no
game_ini:
	pusha	
	
	call game_ini_screenini
	call game_ini_energy
	; player position
	mov [g_xpos],byte 0
	mov [g_ypos],byte 3
	
	; ini score
	mov [g_score],byte 0x01	
	
	popa
	ret
;---------------
; 화면을 초기화 하는 서브루틴
; in: no
; out: no
game_ini_screenini:
	pusha
	call my_cls
	call my_hidecursor
	popa
	ret
;---------------
; 게임 에너지의 초기 위치값을 지정하는 서브루틴
; in: (g_energy)
; out: no
game_ini_energy:
	pusha	
	; index = x + y*X_COUNT  : X_COUNT , Y_COUNT range 
	mov [g_energy+ 0+ 2*X_COUNT],byte MY_ENERGY ; (0,0)
	mov [g_energy+5 + 6*X_COUNT],byte MY_ENERGY; (5,0)
	mov [g_energy+7+ 5*X_COUNT],byte MY_ENERGY;  (7,0)
	mov [g_energy+2 + 3*X_COUNT],byte MY_ENERGY; (2,3)
	popa
	ret

	
;---------------
; 사용자와 에너지의 충돌을 체크하여 처리 하는 서브루틴
; 충돌하면 점수를 1 증가시키고, 에너지를 소멸 시킨다. 
; in:  (g_xpos,g_ypos,g_energy,g_score) 
; out: no
game_check_energy:
	pusha
	mov al,[g_ypos]
	mov bl,byte X_COUNT
	mul bl ; ax = al * g_tempy
	mov cx,0
	mov cl,byte [g_xpos]
	add ax,cx
	mov bx,g_energy
	add bx,ax
	
	
	cmp [bx],byte MY_ENERGY
	jne end_game_ehck_enenrgy
	mov [bx],byte 0x00
	mov bx,g_score
	add [bx],byte 0x01
end_game_ehck_enenrgy:	
	popa
	ret	
;---------------
; 화면에 에너지를 출력하는 서브루틴(스택을 지역 변수로 사용) 
; in: (g_energy)
; out: no
game_draw_energy_ex:
	pusha
		
	mov bp,sp
	sub sp,2   ; x:bp y:bp+1
	
	mov [bp+1],byte 0
ty_loop:
    cmp [bp+1],byte Y_COUNT
	je tend_y
	
	mov [bp],byte 0
tx_loop:	
	cmp [bp],byte X_COUNT
	je tnext_y
	; begin_user_logic
	; index = y*line_size + x_loop
	
	mov al,[bp+1]
	mov bl,byte X_COUNT
	mul bl ; ax = al * g_tempy
	mov cx,0
	mov cl,byte [bp]
	add ax,cx
	mov bx,g_energy
	add bx,ax
	
	
	cmp [bx],byte MY_ENERGY
	jne tend_x
	;---draw energy

	mov dl,byte [bp]
	mov dh,byte [bp+1]
	call my_goto ; dl,dh
	mov dl,MY_ENERGY
	mov ah,02h
	int 21h
	
tend_x:	
	; end_user_logic
	inc byte [bp]
	jmp tx_loop	
tnext_y:		
	inc byte [bp+1]
	jmp ty_loop
tend_y:	
	
	add sp,2
	
	popa
	ret
	
;---------------
; 특정 위치에 점수를 16진수 값으로 출력하는 서브루틴
; in: ( g_score) 
; out: no 
game_draw_score:
	pusha
	mov dl,50
	mov dh,1
	call my_goto
	
	mov dx,g_scoremsg
	call my_print_string
	
	mov al,[g_score]
	call my_print_hex
	popa
	ret
 
;---------------
; 플레이어를 출력하는 서브루틴
; in: (g_xpos,g_ypos)
; out: no
game_draw_player:
	pusha
	
	mov dl,[g_xpos]
	mov dh,[g_ypos]
	call my_goto ; dl,dh
	mov dl,MY_PLAYER_CHR
	mov ah,02h
	int 21h
	
	popa
	ret
;---------------
; 도움말을 출력하는 함수 
; in: (g_helpmsg)
; out: no	
game_draw_help:
	pusha
	
	mov dl,0
	mov dh,20
	call my_goto
	
	mov dx,g_helpmsg
	call my_print_string
	
	popa
	ret
;---------------
; 게임의 화면을 출력하는 메인 함수 
; in: no
; out: no
game_draw:  ; no parameter
	pusha
	call my_cls
	call my_hidecursor
	
	call game_draw_energy_ex 
	call game_draw_score
	
	call game_draw_player 
	call game_draw_help

	popa
	ret

;------------------------------
; 화면에서 커서를 없애는 서브루틴
; in: no
; out: no
my_hidecursor: ; noparameter
	pusha
	mov ah,3
	int 10h
	or ch,30h
	mov ah,1
	int 10h	
	popa
	ret
;------------------------------
; 키보드로부터 스캔,아스키 코드값을 받는 서브루틴
; in: no
; out: g_scancode(스캔코드값),g_asccode아스키코드값)
my_getkey:;(*g_scancode,*g_asccode)
	pusha
	mov ah,10h
	int 16h	
	mov [g_scancode],ah
	mov [g_asccode],al
	popa
	ret
;---------------
; '$'로 끝나는 문자열을 출력하는 서브루틴
; in: dx(출력할 메지시 주소값)
; out: no
my_print_string: ; dx
	pusha
	mov ah,9
	int 21h
	popa
	ret
;---------------
; AL 레지스터의 값을 16진수 값으로 화면에 출력하는 서브루틴
; in: al 
; out: no
my_print_hex:  
	pusha
	push ax
	mov dx,0
	mov dl,al
	shr dl,4
	and dl,0x0f
	
	mov bx,g_codetable
	add bx,dx
	mov dl,[bx]
	mov ah,02h
	int 21h
	
	pop ax
	mov dx,0
	mov dl,al
	and dl,0x0f
	mov bx,g_codetable
	add bx,dx
	mov dl,[bx]
	mov ah,02h
	int 21h
	
	mov dl,' '
	mov ah,02h
	int 21h
	
	popa
	ret
;---------------
; 프로그램을 종료하고 MS-DOS로 돌아가는 서브루틴
; in: no
; out: no	
my_exit: ; no parameter
	mov ah,4ch
	mov al,0
	int 21h
	ret
;---------------
; 화면에서 커서의 위치를 x,y로 옮기는 서브루틴
; in: (dx,dh)
; out: no	
my_goto: 
	pusha	
	mov ah,2
	mov bh,0
	int 10h
	popa
	ret
;---------------
; 화면을 초기화하는 서브루틴
; in: no
; out: no
my_cls: 
	pusha
	mov ah,0x00
	mov al,0x03
	int 10h
	popa
	ret
	
section .data
	g_codetable: db '0123456789ABCDEF',13,10,'$'
	g_scoremsg:  db 'score:','$'
	g_helpmsg:   db '> q: game exit!',13,10,
  	             db '> move: left,right,up,down arrow key!','$'	
	g_energy:    times X_COUNT*Y_COUNT db 0
	
	
section .bss
	g_scancode resb 1
	g_asccode  resb 1
	
	g_score  resb 1
	
    g_xpos resb 1
	g_ypos resb 1

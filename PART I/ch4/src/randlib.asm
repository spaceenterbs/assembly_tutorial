%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    xor rax, rax
    ret
    
section .data
    ; *** Rounding flags for FRNDINT
    rndMath     dw 0x037F         ;Default round after FINIT    (mathematische Rundung)
    rndCeil     dw 0x037F|0x0800  ;Round up   to high integer   (Gaussklammer oben)
    rndFloor    dw 0x037F|0x0400  ;Round down to low  integer   (Gaussklammer unten)
    rndTrunc    dw 0x037F|0x0C00  ;Truncate towards zero int    (Nachkommawert abschneiden)
    
    ; *** Random Generator: linear congruential generator (LCG)
    randConst   dd 0x00003039     ;ANSI C: Addition constant:   =      12345
    randMult    dd 0x41C64E6D     ;ANSI C: Multiplicator:       = 1103515245
    randShift   dd 0x00000000     ;ANSI C: No shift necessary
    randMask    dd 0x7FFFFFFF     ;ANSI C: Take bits 0..30
    randValue   dd 0x3C6EF35F     ;Initial value & result container

section .text
; ---------------------------------------------------------------------------
; ---                         R N D   D O U B L E                         ---
; ---------------------------------------------------------------------------
;
; rndDoubleFunc is a LCG random number generator based on ANSI C specification.
; This floating point versions returns values 0 <= rnd <= 1
;
; DOUBLE rndDoubleFunc()
; DOUBLE seedDoubleFunc()
;
; ---------------------------------------------------------------------------

rndDoubleFunc:
            push  edx                           ;Save edx register
            mov   eax,  [randValue]             ;Calculate
            mov   edx,  [randMult]              ; R(n+1) :=
            mul   edx                           ; (R(n)*MULT + CONST)
            add   eax,  [randConst]             ; MOD MASK
            and   eax,  [randMask]              ; in CPU register and
            mov   dword [randValue],   eax      ; save back R(n+1)
            pop   edx                           ;Restore edx regsiter
            fild  dword [randValue]             ;Normalize
            fidiv dword [randMask]              ; to ONE in FPU
.end:       ret                                 ;Return

seedDoubleFunc:
            push  edx                           ;Save edx register
            rdtsc                               ;Get real time clock
            and   eax,  [randMask]              ; and mask it and
            mov   dword [randValue],   eax      ; save back as R(n+1)
            pop   edx                           ;Restore edx regsiter
            fild  dword [randValue]             ;Normalize
            fidiv dword [randMask]              ; to ONE in FPU
.end:       ret                                 ;Return

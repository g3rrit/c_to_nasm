; Disassembly of file: main.o
; Sat Oct 28 11:52:35 2017
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: 8086, x64


global main

extern printf                                           ; near
extern malloc                                           ; near


SECTION .text                             ; section number 1, code

main:   ; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        sub     rsp, 16                                 ; 0004 _ 48: 83. EC, 10
        mov     edi, 16                                 ; 0008 _ BF, 00000010
        call    malloc                                  ; 000D _ E8, 00000000(rel)
        mov     qword [rbp-8H], rax                     ; 0012 _ 48: 89. 45, F8
        mov     rax, qword [rbp-8H]                     ; 0016 _ 48: 8B. 45, F8
        mov     dword [rax], 10                         ; 001A _ C7. 00, 0000000A
        mov     rax, qword [rbp-8H]                     ; 0020 _ 48: 8B. 45, F8
        mov     qword [rax+8H], ?_001                   ; 0024 _ 48: C7. 40, 08, 00000000(d)
        mov     rax, qword [rbp-8H]                     ; 002C _ 48: 8B. 45, F8
        mov     rax, qword [rax+8H]                     ; 0030 _ 48: 8B. 40, 08
        mov     rdi, rax                                ; 0034 _ 48: 89. C7
        mov     eax, 0                                  ; 0037 _ B8, 00000000
        call    printf                                  ; 003C _ E8, 00000000(rel)
        mov     eax, 0                                  ; 0041 _ B8, 00000000
        leave                                           ; 0046 _ C9
        ret                                             ; 0047 _ C3
; main End of function


SECTION .data                           ; section number 2, data


SECTION .bss                            ; section number 3, bss


SECTION .rodata                         ; section number 4, const

?_001:                                                  ; byte
        db 68H, 65H, 6CH, 6CH, 6FH, 20H, 77H, 6FH       ; 0000 _ hello wo
        db 72H, 6CH, 64H, 0AH, 00H                      ; 0008 _ rld..



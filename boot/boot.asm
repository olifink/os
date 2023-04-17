[org 0x00]
[bits 16]

section code

.init:
    mov eax, 0xb800                     ; screen address 80chars 25 lines
    mov es, eax                         ; ..use it as base address
    mov eax, 0                          

.clear:
    mov byte [es:eax], 0                ; clear char information
    inc eax
    mov byte [es:eax], 0x40             ; set some color attributes
    inc eax

    cmp eax, 2 * 25 * 80                ; fill up the screen array
    jl  .clear

.main:

    mov byte [es:0x00], 'H'             ; character 
    mov byte [es:0x01], 0x30            ; color information

jmp $                                   ; hang here

; file needs to be 512 bytes 
times 510 - ($ - $$) db 0x00            ; pads up until end

; 2 magic exec marker bytes
db 0x55
db 0xaa
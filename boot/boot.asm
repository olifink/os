[org 0x00]
[bits 16]

section code

.main:
    mov eax, 0xb800                     ; screen address
    mov es, eax

    mov byte [es:0x00], 'H'             ; character 
    mov byte [es:0x01], 0x30            ; color information

jmp $                                   ; hang here

; file needs to be 512 bytes
times 510 - ($ - $$) db 0x00            ; pads up until end

; 2 magic exec marker bytes
db 0x55
db 0xaa
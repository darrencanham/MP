.model small
.386
.stack 100H    ; Stack size
.data

data1 dd 0000H
msg db 10,13,'Enter the first no.::$'
msg1 db 10,13,'Enter the second no.::$'
msg2 db 10,13,'The Resultant sum is ::$'

.code
.startup

; write string to standard output
MOV AH,09
MOV DX,OFFSET msg
INT 21h

; Read character from STDIN
; and convert ascii to binary 
MOV AH,01
INT 21h
SUB AL,30h
MOV BL,AL

; write string to standard output
MOV AH,09
MOV DX,OFFSET msg1
INT 21h

; Read character from STDIN
; and convert ascii to binary 
MOV AH,01
INT 21h 
SUB AL,30H
ADD BL,AL

; write string to standard output
MOV AH,09
MOV DX,OFFSET msg2
INT 21H


MOV DL,BL 
CMP DL,09   ; if DL > 9 then jump to L6
JG L6 
ADD DL,30H  ; else
JMP L7      ; output result & terminate program

L6: ADD DL,37h
L7: MOV AH,02   ; write character to STDOUT
    INT 21h 
    MOV AH,4Ch  ; terminate with return code "EXIT"
    INT 21H
.EXIT
END
    

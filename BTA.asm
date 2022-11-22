.MODEL SMALL
.DATA

msg1 db 10,13,'Enter a binary no.:$'
msg2 db 10,13,'Enter ASCII Character is:$'

.code
.startup

MOV AH,09H
LEA DX,msg1
INT 21H

MOV BL,00H
MOV CL,08H

L1: MOV AH,01
    INT 21H
    SUB AL,30H
    SHL BL,1
    ADD BL,AL
LOOP L1

MOV AH,09H
LEA DX,msg2
INT 21H

MOV DL,BL
MOV AH,02H
INT 21H

.exit 
END
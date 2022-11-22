.MODEL SMALL
.DATA

msg db 'Enter a no.:$'
result db 10,13,'Binary no. is:$'
.code
.startup 

LEA DX,msg
MOV AH,09H
INT 21H

MOV AH,01H
INT 21H
MOV BL,AL

LEA DX,result
MOV AH,09H
INT 21H

MOV CL,08H
MOV AH,00H
MOV AL,BL

L1: SHL AL,01H
    MOV BL,AL
    MOV AL,00H
    ADC AL,30H
    MOV DL,AL

    MOV AH,02H
    INT 21H

    MOV AL,BL

LOOP L1

.exit
end
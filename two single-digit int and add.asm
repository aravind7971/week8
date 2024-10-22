org 100h
mov dx,offset msg_input1
mov ah,09h
int 21h
mov ah,01h
int 21h
mov bl,al
cmp al,'0'
jl NotDigit
cmp al,'9'
jg NotDigit
mov dx,offset msg_output1
mov ah,09h
int 21h
mov dl,bl
mov ah,02h
int 21h
mov dx,offset msg_input2
mov ah,09h
int 21h
mov ah,01h
int 21h
mov cl,al
cmp al,'0'
jl NotDigit
cmp al,'9'
jg NotDigit
mov dx,offset msg_output2
mov ah,09h
int 21h
mov dl,cl
mov ah,02h
int 21h
mov dx,offset msg_sub
mov ah,09h
int 21h
sub bl, '0'          
sub cl, '0'
add bl,cl
mov al,bl
AND al,0F0h
shr al, 4
add al,30h
cmp al,39h
jle first_bit
add al,7h
first_bit: mov dl,al
mov ah,02h
int 21h
mov al,bl
and al,0Fh
add al,30h
cmp al,39h
jle second_bit
add al,7h
second_bit: mov dl,al
mov ah,02h
int 21h
jmp endprogram
NotDigit:
mov dx,offset msg_error
mov ah,09h
int 21h
endprogram:
mov ah,4Ch
int 21h
msg_input1 DB "enter first digit:$"
msg_output1 Db 0dh,0ah,"The entered digit is: $"
msg_input2 DB 0dh,0ah,"enter second digit:$"
msg_output2 Db 0dh,0ah,"The entered digit is: $"
msg_sub db 0dh,0ah,"The addition of given two digits is: $"
msg_error db 0dh,0ah,"Error: Not a digit!$"

END
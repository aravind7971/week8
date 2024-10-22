org 100h  
mov dx,offset msg
mov ah,09h
int 21h
mov al,43h
mov bl,al

AND al,0F0h
shr al, 4
add al,30h
first_bit: mov dl,al
mov ah,02h
int 21h
mov al,bl
and al,0Fh
add al,30h
second_bit: mov dl,al
mov ah,02h
int 21h
ret    
msg DB 0dh, "The two digit number is: $"
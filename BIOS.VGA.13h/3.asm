use16
org 0x7C00
mov ax,0x0013
int 0x10
mov ax,0xA000
mov es,ax
xor di,di
mov cx,32000
xor ax,ax
rep stosw
mov byte[x],10
mov byte[y],10
call d
jmp $
c:db 0x38,0x6C,0xC6,0xC6,0xD6,0xD6,0xC6,0xC6,0x6C,0x38
x:db 0
y:db 0
d:mov si,c
movzx bx,byte[y]
movzx ax,byte[x]
mov cx,320
imul bx,cx
add bx,ax
mov di,bx
mov cx,10
nxtln:
lodsb
push cx
mov cx,7
mov ah,al
nxtpx:
shl ah,1
jnc skp
mov al,0x28
mov[es:di],al
mov al,ah
skp:
inc di
loop nxtpx
add di,320-7
pop cx
loop nxtln
ret
times 510-($-$$) db 0
dw 0xAA55

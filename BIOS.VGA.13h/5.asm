use16
org 0x7C00
var0:mov ax,0x0013
int 0x10
mov ax,0xA000
mov es,ax
xor di,di
mov cx,32000
xor ax,ax
rep stosw
mov byte[var0+1],0
mov byte[var0+2],0
mov byte[var0],4
s:call d
add byte[var0+1],8
dec byte[var0]
jnz s
jmp $
c:db 0xAA,0x55,0xAA,0x55,0xAA,0x55,0xAA,0x55
x:db 0
y:db 0
d:mov si,c
movzx bx,byte[var0+2]
movzx ax,byte[var0+1]
mov cx,320
imul bx,cx
add bx,ax
mov di,bx
mov cx,8
nxtln:lodsb
push cx
mov cx,8
mov ah,al
nxtpx:shl ah,1
jnc skp
mov al,0x28
mov[es:di],al
mov al,ah
skp:inc di
loop nxtpx
add di,320-8
pop cx
loop nxtln
ret
times 510-($-$$) db 0
dw 0xAA55

;Drive a Stepper Motor interface to rotate the motor in anticlockwise direction
assume cs:code,ds:data
data segment
	pa equ 24A0h
	pb equ 24A1h
	pc equ 24A2h
	cr equ 24A3h
data ends
code segment
start:
	mov ax,data
	mov ds,ax

	mov dx,cr
	mov al,80h
	out dx,al

	;mov cx,64h (or) mov cx,100d(for 180 degrees rotation 180/1.8)
	;mov cx,32h (or) mov cx,50d(for 90 degrees rotation 90/1.8)

	mov cx,64h
	mov al,77h

	mov dx,pc
rot_anticlock:
	out dx,al
	rol al,1                ; instruction rotate
	call delay
	loop rot_anticlock

	mov ah,4ch
	int 21h

delay proc
	mov bx,02fffh
    l2: mov di,0ffffh
    l1: dec di
	jnz l1
	dec bx
	jnz l2
	ret
delay endp

code ends
end start

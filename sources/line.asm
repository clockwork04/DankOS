org 0x0100			; Program is loaded at offset 0x0100
bits 16				; 16-bit real mode code

mov si, line1
push 0x02
int 0x80

push 0x07
int 0x80
push 0x03
int 0x80

mov word [x0], ax

mov si, line2
push 0x02
int 0x80

push 0x07
int 0x80
push 0x03
int 0x80

mov byte [y0], al

mov si, line3
push 0x02
int 0x80

push 0x07
int 0x80
push 0x03
int 0x80

mov word [x1], ax

mov si, line4
push 0x02
int 0x80

push 0x07
int 0x80
push 0x03
int 0x80

mov byte [y1], al

mov si, line5
push 0x02
int 0x80

push 0x07
int 0x80
push 0x03
int 0x80

mov byte [colour], al

push 0x80			; Enter graphics mode
int 0x80

mov bx, word [x0]
mov cl, byte [y0]
mov ax, word [x1]
mov ch, byte [y1]
mov dl, byte [colour]

push 0x83			;Draw Line
int 0x80

push 0x86			; Push frame
int 0x80

push 0x18			; Pause
int 0x80

push 0x82			; Exit graphics mode
int 0x80

push 0x00			; Return to the command line
int 0x80




line1		db	'Starting X: ', 0x00
line2		db	'Starting Y: ', 0x00
line3		db	'Target X: ', 0x00
line4		db	'Target Y: ', 0x00
line5		db	'Colour: ', 0x00



x0		dw	0x0000
y0		db	0x00
x1		dw	0x0000
y1		db	0x00
colour		db	0x00















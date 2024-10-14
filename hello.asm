section .data
    msg db 'Odeio a ideia de: Hello World!', 0xA
		tam equ $- msg

		; msg db 'Odeio a ideia de: ', 0xA
		; msgC db 'Hello World!', 0xA ; -> Sempre que criar uma msg, é comundo ja determinar o tamanho para ela 
    ; tam equ $- msg  

section .text

global _start

_start:
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, msg
    mov edx, tam
    int 0x80

    mov eax, 0x1
    mov ebx, 0x0
    int 0x80

org 100h       ; Programa COM para DOS

mov ah, 0      ; Reset Timer
int 1Ah        ; Llamada al reloj -> DX = tiempo inicial
mov cx, dx     ; Guardamos el tiempo inicial en CX

mov ax, 0      ; Valor para sumar
mov bx, 1000   ; Número de iteraciones
lea di, buffer ; Apuntamos al buffer donde guardamos caracteres

ciclo:
    add ax, bx ; Operación que medimos
    mov word [di], '*'  ; Guardamos el caracter
    inc di        ; Avanzamos el puntero
    loop ciclo    ; Repetimos el ciclo hasta que CX = 0

mov ah, 0      ; Volvemos a llamar al reloj
int 1Ah        ; Tiempo final
sub dx, cx     ; Calculamos tiempo total

; Mostrar resultado
mov ax, dx     ; Guardamos el tiempo total
add ax, 30h    ; Convertimos a ASCII
mov ah, 02h    ; Interrupción para mostrar
int 21h

; Mostrar el total de caracteres (operaciones)
mov ah, 09h    ; Mostrar string
lea dx, buffer
int 21h

mov ax, 4C00h  ; Salir
int 21h

buffer db 1000 dup ('$') ; Buffer para guardar caracteres


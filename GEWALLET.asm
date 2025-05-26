.model small 
.stack 1000h 
.data 
    ; --- Mensajes y textos de la interfaz ---
    materia db 10,13,'Arquitectura de Computadores $'
    nombres db 10,13,'Emerson Amir Vera Gonzalez-1152378   Jesus Gabriel Torres Daza-1152351 $'
    titulo db 10,13,  'GE WALLET $'
    exitmsg db 10,13, 'SISTEMA CERRADO! $'
    crearmsg db 10,13, 'CREAR NUEVA CUENTA $'
    detallemsg db 10,13,'DETALLES DE TU CUENTA $'
    retirarmsg db 10,13, 'RETIRAR $'
    depositarmsg db 10,13, 'DEPOSITAR $'
    modificarmsg db 10, 13, 'CUIDADO! PROCEDERA A MODIFICAR SU CUENTA $'

    ; --- Menú principal ---
    mainmsg0 db 10,13,'0. Salir$'                         
    mainmsg1 db 10,13,'1. Crear Nueva Cuenta$'
    mainmsg2 db 10,13,'2. Ingresar a una cuenta$'

    ; --- Menú de la cuenta ---
    accmsg0 db 10,13,'0. Salir de la cuenta$'
    accmsg1 db 10,13,'1. Revisar Detalles$'
    accmsg2 db 10,13,'2. Retirar Dinero$'
    accmsg3 db 10,13,'3. Depositar Dinero$'
    accmsg4 db 10,13,'4. Actualizar Cuenta$'

    mainmsg7 db 10,13,'Presionar Enter para volver al menu principal$'
    mainmsg8 db 10,13,'Presionar Enter para continuar$'

    ; --- Mensajes de detalles de cuenta ---
    detallemsg1 db 10,13, 'Nombre de la cuenta: $'
    detallemsg2 db 10, 13, 'Ciudad: $' 
    detallemsg3 db 10, 13, 'No hay cuentas guardadas actualmente!!$' 
    detallemsg4 db 10, 13, 'Total de Dinero restante: $' 
    detallemsg5 db 10, 13, 'El saldo de la cuenta es cero $'
    detallemsg6 db 10, 13, 'Departamento: $'    
    detallemsg7 db 10, 13, 'Telefono: $' 

    ; --- Opciones de dinero ---
    dineromsg1 db 10,13,'1.  COP. 1000$'
    dineromsg2 db 10,13,'2.  COP. 2000$'
    dineromsg3 db 10,13,'3.  COP. 5000$'
    dineromsg4 db 10,13,'4.  COP. 10000$'
    dineromsg5 db 10,13,'Introducir codigo >> $'
    dineromsg6 db 10,13,'Limite de retiro superado. Proceso finalizado. $'
    dineromsg7 db 10,13,'Dinero retirado con exito. $' 
    dineromsg8 db 10,13,'Dinero depositado con exito. $'

    inputmsg db 'Escoge una opcion >>  $'
    inputCode db ? 

    ; --- Buffers de datos de cuenta ---
    pinCuenta      db 19 dup(' '), '$'
    nombreCuenta   db 19 dup(' '), '$'
    telefonoCuenta db 19 dup(' '), '$'
    ciudadCuenta   db 19 dup(' '), '$'
    dptoCuenta     db 19 dup(' '), '$'
    montoStr       db 19 dup(' '), '$'

    pinCuentacount dw 0       ; Cantidad de dígitos del pin
    montoTotal dw 0           ; Monto actual de la cuenta
    opcionDeposito db ? 

    ; --- Mensajes de creación de cuenta ---
    crear1 db 10,13,'1. Ingrese el nombre de la cuenta : $'
    crear2 db 10,13,'2. Ingrese el Pin (4 digitos):  $'
    crear5 db 10,13,'3. Ingrese numero de telefono. :  $'
    crear6 db 10,13,'4. Ingrese ciudad :  $'
    crear7 db 10,13,'5. Ingrese departamento :  $'
    crear8 db 10,13,'6. Ingrese monto inicial: $'
    crear3 db 10,13,'Cuenta creada. $'
    crear4 db 10,13,'Presiona Enter para confirmar. $' 

    pinMsg db 10,13,'Introducir Pin >> $'

    intermitente db 10,13,'>>  $'   ; Cursor de entrada
    saltoDeLinea db 10,13, '    $' ; Nueva línea
    crlf db 13, 10 ; CR +LF

    ; --- Mensajes de modificación de cuenta ---
    modAccMsg1 db 10,13,'1. Nuevo nombre de cuenta ( Antiguo: $'
    modAccMsg2 db ' ) : >> $'
    modPinMsg1 db 10,13,'2. Nuevo pin ( Antiguo: $' 
    modPinMsg2 db ' ) : >>$' 
    modTelMsg1 db 10,13,'3. Nuevo telefono ( Antiguo: $' 
    modTelMsg2 db ' ) : >>$' 
    modCiuMsg1 db 10,13,'4. Nueva ciudad ( Antiguo: $' 
    modCiuMsg2 db ' ) : >>$' 
    modDptoMsg1 db 10,13,'5. Nuevo departamento ( Antiguo: $' 
    modDptoMsg2 db ' ) : >>$' 
    modMontoMsg1 db 10,13,'6. Nuevo Monto ( Antiguo: $' 
    modMontoMsg2 db ' ) : >>$' 
    modSuccess db 10,13,'Detalles de Cuenta Actualizado. $' 

    ; --- Buffers para archivo y entrada ---
    recordBuffer db 122 dup(?)      ; Buffer para leer/escribir registros
    telefonoInput   db 20 dup('$')  ; Buffer para entrada de teléfono
    pinInput        db 20 dup('$')  ; Buffer para entrada de pin

    ; --- Mensajes de login ---
    msg_telefono    db 10,13,'Ingrese su telefono: $'
    msg_pin_login   db 10,13,'Ingrese su PIN (4 digitos): $'
    msg_login_ok    db 10,13,'Acceso concedido!$',0
    msg_login_error db 10,13,'Credenciales incorrectas!$',0
    
    filename  db "users.txt", 0
    handle    dw ?
    buffer    db 10 dup(?)
    msg_abierto  db 10, 13, "Error abriendo archivo!$"
    msg_buscar  db 10, 13, "Error buscando archivo!$"
    msg_escribir db 10, 13, "Error escribiendo archivo!$"
    msg_cerrar db 10, 13, "Error cerrando archivo!$"
    new_line db 13,10

    tempfile      db "temp.tmp",0
    temp_handle   dw ?
    msg_crear_temp db 10,13,"Error creando archivo temporal!$"
    msg_leer      db 10,13,"Error leyendo archivo!$"
    msg_renombrar db 10,13,"Error actualizando archivo!$"

    msg_debug_pin_archivo db 10,13,'PIN Archivo: $'
    msg_debug_pin_input db 10,13,'PIN Input: $'

    registroActual dw 0
    contadorRegistros dw 0
    
.code 

    ; ######################################################################################### ;
    ;  FUNCIONES DE UTILIDAD                                                                    ;
    ; ######################################################################################### ;

    insert proc
        ; Abrir archivo en modo “append” (lectura/escritura, solo escribir)
        mov ah, 3Dh         
        mov al, 2          
        lea dx, filename
        int 21h
        jnc continuar_abierto  ; Si NO hay error, continuar
        jmp NEAR PTR err_abrir        ; Si hay carry, salto a etiqueta de error
       
    continuar_abierto:
        mov handle, ax      ; Guardamos el file handle en nuestra variable
        mov bx, ax          

        ; Obtener el tamaño del archivo
        mov ah, 42h
        mov al, 2           
        xor cx, cx
        xor dx, dx
        int 21h        

        ; Verificar si el archivo está vacío
        cmp ax, 0
        jne agregar_salto_linea
        cmp dx, 0
        jne agregar_salto_linea
        jmp escribir_datos

    agregar_salto_linea:
        ; Mover el puntero al final del archivo (por si acaso)
        mov ah, 42h
        mov al, 2           ; Método "desde el final"
        xor cx, cx
        xor dx, dx
        int 21h
        
        ; Escribir CRLF solo si el archivo no está vacío
        mov bx, handle
        mov ah, 40h
        lea dx, new_line
        mov cx, 2
        int 21h

        escribir_datos:
        ; Escribe todos los campos de la cuenta en el archivo (20 bytes cada uno)
        mov bx, handle
        mov ah, 40h
        lea dx, pinCuenta
        mov cx, 20
        int 21h

        mov bx, handle
        mov ah, 40h
        lea dx, nombreCuenta
        mov cx, 20
        int 21h

        mov bx, handle
        mov ah, 40h
        lea dx, telefonoCuenta
        mov cx, 20
        int 21h

        mov bx, handle
        mov ah, 40h
        lea dx, ciudadCuenta
        mov cx, 20
        int 21h

        mov bx, handle
        mov ah, 40h
        lea dx, dptoCuenta
        mov cx, 20
        int 21h

        mov bx, handle
        mov ah, 40h
        lea dx, montoStr
        mov cx, 20
        int 21h

        ; Cierra el archivo
        mov bx, handle
        mov ah, 3Eh
        int 21h
        ret

    err_abrir:
        ; Mostrar mensaje de error y regresar sin escribir
        lea dx, msg_abierto
        mov ah, 09h
        int 21h
        ret
    insert endp

    ; Macro para imprimir cadenas
    imprimirString macro str
        lea dx, str
        mov ah, 09h
        int 21h 
    endm 

    ; Mostrar los créditos y título
    displaySub proc near 
        imprimirString materia
        imprimirString saltoDeLinea
        imprimirString nombres
        imprimirString saltoDeLinea
        imprimirString titulo
        ret
    displaySub endp

    ; Mostrar Menú Principal 
    mostrarMenuPrincipal proc near
        imprimirString mainmsg0
        imprimirString mainmsg1
        imprimirString mainmsg2
        imprimirString saltoDeLinea 
        ret
    mostrarMenuPrincipal endp

    ; Mostrar Menú de la Cuenta 
    mostrarMenuCuenta proc near
        imprimirString accmsg0
        imprimirString accmsg1
        imprimirString accmsg2
        imprimirString accmsg3
        imprimirString accmsg4
        imprimirString saltoDeLinea 
        ret
    mostrarMenuCuenta endp

    ; Lee una opción del menú principal o de cuenta
    inputMenu proc near 
        imprimirString inputmsg 
        imprimirString intermitente
        mov ah, 1
        int 21h 
        mov inputCode, al 
        ret 
    inputMenu endp 

    ; Mensaje de salida del sistema
    mostrarAdios proc near  
        imprimirString exitmsg
        imprimirString saltoDeLinea
        ret 
    mostrarAdios endp

    ; Limpia la pantalla y posiciona el cursor al inicio
    limpiarPantalla proc near
        mov ax, 0600h   ; Scroll up toda la pantalla
        mov bh, 07h     ; Fondo negro, letras blancas
        mov cx, 0000h   ; Esquina superior izquierda
        mov dx, 184Fh   ; Esquina inferior derecha
        int 10h
        
        ; Posicionar cursor al inicio
        mov ah, 02h
        mov bh, 00h
        mov dx, 0000h
        int 10h
        ret     
    limpiarPantalla endp


    ; ######################################################################################### ;
    ;  LOGIN Y MANEJO DE ARCHIVO DE USUARIOS                                                    ;
    ; ######################################################################################### ;

    ; Verifica el PIN ingresado y carga la cuenta si es correcto
    verificarCuenta proc
        imprimirString msg_pin_login
        call getPin            ; Captura el PIN en pinInput
        imprimirString saltoDeLinea

        ; 2) Abrir archivo en modo lectura
        mov ah, 3Dh
        mov al, 0              
        lea dx, filename
        int 21h
        jnc archivo_abierto     ; Si NO hay error, continuar
        jmp NEAR PTR error_apertura ; Salto largo explícito si hay error
        
    archivo_abierto:
        mov handle, ax
        mov contadorRegistros, 0 

    buscar_pin:
        ; Leer registro completo (122 bytes)
        mov ah, 3Fh
        mov bx, handle
        mov cx, 122
        lea dx, recordBuffer
        int 21h
        cmp ax, 0
        je pin_no_encontrado  ; Fin de archivo

        ; avanzamos al siguiente registro
        inc contadorRegistros

        ; DEBUG: Mostrar PIN del archivo
        ;mov ah, 09h
        ;lea dx, msg_debug_pin_archivo
        ;int 21h
        ;mov ah, 40h
        ;mov bx, 1
        ;lea dx, recordBuffer
        ;mov cx, 4
        ;int 21h

        ; DEBUG: Mostrar PIN ingresado
        ;mov ah, 09h
        ;lea dx, msg_debug_pin_input
        ;int 21h
        ;mov ah, 40h
        ;mov bx, 1
        ;lea dx, pinInput
        ;mov cx, 4
        ;int 21h
        ;mov ah, 02h
        ;mov dl, 0Ah
        ;int 21h

        ; Comparar solo los primeros 4 bytes (PIN)
        lea si, recordBuffer  ; PIN en archivo
        lea di, pinInput      ; PIN ingresado
        mov cx, 4            ; Comparar 4 caracteres

    comparar_digito:
        mov al, [si]
        cmp al, [di]
        jne siguiente_registro
        inc si
        inc di
        loop comparar_digito

        ; Verificar que el siguiente carácter sea espacio
        cmp byte ptr [si], ' '
        jne siguiente_registro

        ; PIN válido encontrado - Cargar cuenta
        mov ax, contadorRegistros
        mov registroActual, ax     ; guardamos correctamente el índice
        call cargar_cuenta_desde_record
        imprimirString msg_login_ok
        imprimirString saltoDeLinea
        imprimirString mainmsg8

        mov ah, 07h
        int 21h

        mov ax, 1             ; Indicar éxito
        jmp cerrar_archivo

    siguiente_registro:
        jmp buscar_pin

    pin_no_encontrado:
        imprimirString msg_login_error
        call etcm
        mov ax, 0             ; Indicar fallo

    cerrar_archivo:
        push ax
        mov ah, 3Eh
        mov bx, handle
        int 21h
        pop ax
        ret

    error_apertura:
        imprimirString msg_abierto
        xor ax, ax
        ret
    verificarCuenta endp


    imprimir_buffer proc
        mov ah,40h
        mov bx,1             
        mov dx,si
        int 21h
        ret
    imprimir_buffer endp


    cargar_cuenta_desde_record proc
        ;  PIN (offset 0) 
        ; Limpiar buffer
        mov cx, 19
        mov al, ' '
        lea di, pinCuenta
        rep stosb
        ; Copiar 19 bytes desde recordBuffer[0]
        mov cx, 19
        lea si, recordBuffer
        lea di, pinCuenta
        rep movsb
        ; Terminador
        mov byte ptr [pinCuenta+19], '$'
        ; Guardar longitud del PIN
        mov pinCuentaCount, 4

        ;  Nombre (offset 20) 
        mov cx, 19
        mov al, ' '
        lea di, nombreCuenta
        rep stosb
        mov cx, 19
        lea si, recordBuffer+20
        lea di, nombreCuenta
        rep movsb
        mov byte ptr [nombreCuenta+19], '$'

        ;  Teléfono (offset 40) 
        mov cx, 19
        mov al, ' '
        lea di, telefonoCuenta
        rep stosb
        mov cx, 19
        lea si, recordBuffer+40
        lea di, telefonoCuenta
        rep movsb
        mov byte ptr [telefonoCuenta+19], '$'

        ;  Ciudad (offset 60) 
        mov cx, 19
        mov al, ' '
        lea di, ciudadCuenta
        rep stosb
        mov cx, 19
        lea si, recordBuffer+60
        lea di, ciudadCuenta
        rep movsb
        mov byte ptr [ciudadCuenta+19], '$'

        ;  Departamento (offset 80) 
        mov cx, 19
        mov al, ' '
        lea di, dptoCuenta
        rep stosb
        mov cx, 19
        lea si, recordBuffer+80
        lea di, dptoCuenta
        rep movsb
        mov byte ptr [dptoCuenta+19], '$'

        ;  Monto (offset 100) 
        mov cx, 19
        mov al, ' '
        lea di, montoStr
        rep stosb
        mov cx, 19
        lea si, recordBuffer+100
        lea di, montoStr
        rep movsb
        mov byte ptr [montoStr+19], '$'

        ;  Convertir montoStr (ASCII) a montoTotal (DW)
        call atoi
        mov montoTotal, ax

        ret
    cargar_cuenta_desde_record endp



    ; Convierte cadena a entero (AX)
    atoi proc
        push si
        push bx
        push cx
        lea si, montoStr
        xor ax, ax
        mov bx, 10
    atoi_loop:
        mov cl, [si]
        cmp cl, ' '
        je atoi_end
        sub cl, '0'
        mul bx
        add ax, cx
        inc si
        jmp atoi_loop
    atoi_end:
        pop cx
        pop bx
        pop si
        ret
    atoi endp


    ; Convierte entero (AX) a cadena
    itoa proc
        push di
        push bx
        push dx
        push cx
        push si

        ; 1. Rellenar todo el buffer con espacios (20 bytes)
        mov cx, 20
        lea di, montoStr
        mov al, ' '
        rep stosb

        ; 2. Convertir número a cadena (rellenando desde el final)
        lea di, montoStr      ; Apuntar al inicio del buffer
        mov bx, 10
        mov ax, montoTotal    ; Usar el valor actual de montoTotal
        mov cx, 0             ; Contador de dígitos

        cmp ax, 0
        jne itoa_convertir
        mov byte ptr [di], '0'
        inc di
        jmp itoa_fin

    itoa_convertir:
        mov si, 0             ; Usar SI como contador de pila local

    itoa_loop:
        xor dx, dx
        div bx                ; AX / 10, resto en DX
        add dl, '0'           ; Convertir a ASCII
        push dx               ; Guardar dígito en la pila
        inc si                ; Contar dígitos
        cmp ax, 0
        jne itoa_loop

        ; Ahora sacar los dígitos en orden correcto
    itoa_pop:
        pop dx
        mov [di], dl
        inc di
        dec si
        jnz itoa_pop

    itoa_fin:
        ; El resto del buffer ya está en espacios
        pop si
        pop cx
        pop dx
        pop bx
        pop di
        ret
    itoa endp


    ; ######################################################################################### ;
    ;  CREAR NUEVA CUENTA                                                                       ;
    ; ######################################################################################### ;
    cuenta_pin macro str 
        ; Limpiar buffer con espacios
        push di
        mov cx, 20
        lea di, str
        clear_loop_pin:
            mov byte ptr [di], ' '
            inc di
            loop clear_loop_pin
        pop di

        mov si, offset str 
        input2: 
            mov ah, 1
            int 21h
            cmp al, 13 
            je crear_telefono
            inc pinCuentacount 
            mov [si], al 
            inc si 
            jmp input2 
        exitMac2:
            ret 
    endm 

    cuenta_nombre macro str 
        ; Limpiar buffer con espacios
        push di
        mov cx, 20
        lea di, str
        clear_loop_nombre:
            mov byte ptr [di], ' '
            inc di
            loop clear_loop_nombre
        pop di

        mov si, offset str 
        input: 
            mov ah, 1
            int 21h 
            cmp al, 13 
            je crear_pin
            mov [si], al 
            inc si 
            jmp input 
        exitMac:
            ret 
    endm 

    cuenta_telefono macro str 
        ; Limpiar buffer con espacios
        push di
        mov cx, 20
        lea di, str
        clear_loop_telefono:
            mov byte ptr [di], ' '
            inc di
            loop clear_loop_telefono
        pop di

        mov si, offset str 
        input3: 
            mov ah, 1
            int 21h
            cmp al, 13 
            je crear_ciudad 
            mov [si], al 
            inc si 
            jmp input3 
        exitMac3:
            ret 
    endm

    cuenta_ciudad macro str 
        ; Limpiar buffer con espacios
        push di
        mov cx, 20
        lea di, str
        clear_loop_ciudad:
            mov byte ptr [di], ' '
            inc di
            loop clear_loop_ciudad
        pop di

        mov si, offset str 
        input4: 
            mov ah, 1
            int 21h
            cmp al, 13 
            je crear_departamento
            mov [si], al 
            inc si 
            jmp input4 
        exitMac4:
            ret 
    endm

    cuenta_departamento macro str 
        ; Limpiar buffer con espacios
        push di
        mov cx, 20
        lea di, str
        clear_loop_dpto:
            mov byte ptr [di], ' '
            inc di
            loop clear_loop_dpto
        pop di

        mov si, offset str 
        input5: 
            mov ah, 1
            int 21h
            cmp al, 13 
            je crear_pincode 
            mov [si], al 
            inc si 
            jmp input5 
        exitMac5:
            ret 
    endm

    cuenta_pincode macro str 
        ; Limpiar buffer con espacios
        push di
        mov cx, 20
        lea di, str
        clear_loop_pinCode:
            mov byte ptr [di], ' '
            inc di
        loop clear_loop_pinCode
        pop di

        mov si, offset str 
        input6: 
            mov ah, 1
            int 21h
            cmp al, 13 
            je cuenta_creada 
            mov [si], al 
            inc si 
            jmp input6 
        exitMac6:
            ret 
    endm 


    getPin proc
        ; Limpiar buffer con espacios
        mov cx, 20
        lea di, pinInput
        mov al, ' '
        rep stosb

        ; Capturar input (máx 19 caracteres + '$')
        lea di, pinInput
        mov cx, 19
    getPinLoop:
        mov ah, 7           
        int 21h
        cmp al, 13
        je add_dollarPin
        mov [di], al
        inc di
        mov dl, '*'            ; Mostrar asterisco
        mov ah, 2
        int 21h
        loop getPinLoop

    add_dollarPin:
        mov byte ptr [di], '$'  ; Añadir '$' al final
        ret
    getPin endp


    ; Enter to continue cuentaLoop
    etc proc
    etcin:
        mov ah,1
        int 21h
        cmp al,13
        jne etcin
        jmp NEAR PTR cuentaLoop
    ret 
    etc endp

    ; Enter to continue mainLoop
    etcm proc
    etcinm:
        mov ah,1
        int 21h
        cmp al,13
        jne etcinm
        jmp NEAR PTR mainLoop
    ret 
    etcm endp

    crear_cuenta proc 
        imprimirString crearmsg
        
        imprimirString saltoDeLinea
        imprimirString crear1
        imprimirString intermitente
        cuenta_nombre nombreCuenta
            
        crear_pin: 
            imprimirString crear2 
            imprimirString intermitente 
            cuenta_pin pinCuenta
            
        crear_telefono: 
            imprimirString crear5 
            imprimirString intermitente 
            cuenta_telefono telefonoCuenta
        
        crear_ciudad: 
            imprimirString crear6 
            imprimirString intermitente 
            cuenta_ciudad ciudadCuenta
        
        crear_departamento: 
            imprimirString crear7 
            imprimirString intermitente 
            cuenta_departamento dptoCuenta
            
        crear_pincode: 
            imprimirString crear8 
            imprimirString intermitente 
            cuenta_pincode montoStr
        
        cuenta_creada: 
            imprimirString crear4
            imprimirString crear3
            call insert 
            call etcm
        ret
    crear_cuenta endp

    ; ######################################################################################### ;
    ;  BUSCAR DETALLES DE LA CUENTA                                                             ;
    ; ######################################################################################### ;

    comprobarCuentaCreada proc 
        cmp pinCuentaCount, 0 
        je cuentaNoCreada 
        ret 

        cuentaNoCreada:
            call limpiarPantalla 
            imprimirString detallemsg3 
            imprimirString mainmsg7
            imprimirString saltoDeLinea
            call etc 
    comprobarCuentaCreada endp 

    limpiarTecladoBuffer	proc near
        limpiar:
            mov ah, 1  
            int 16h
            jz  NoKey
            mov ah, 0   
            int 16h    
            jmp limpiar
        NoKey:
            ret
    limpiarTecladoBuffer	 endp


    imprimirNumero proc 
        mov cx, 0
        mov dx, 0 

        label1: 
            cmp ax, 0 
            je imprimir1 
            mov bx, 10 
            div bx 
            push dx 
            inc cx 
            xor dx, dx 
            jmp label1 

        imprimir1:
            cmp cx, 0 
            je salirImprimir 
            pop dx 
            add dx, 48 
            mov ah, 02h 
            int 21h 
            dec cx 
            jmp imprimir1 

        salirImprimir:
            ret 
    imprimirNumero endp 

    imprimir_detalles proc 
        call comprobarCuentaCreada

        imprimirString detallemsg
        imprimirString saltoDeLinea 
        imprimirString saltoDeLinea 

        imprimirString detallemsg1
        imprimirString nombreCuenta 
        imprimirString saltoDeLinea 

        imprimirString detallemsg7
        imprimirString telefonoCuenta
        imprimirString saltoDeLinea
        
        imprimirString detallemsg2
        imprimirString ciudadCuenta
        imprimirString saltoDeLinea
        
        imprimirString detallemsg6
        imprimirString dptoCuenta
        imprimirString saltoDeLinea 

        imprimirString detallemsg4
        mov ax, montoTotal 
        cmp ax, 0
        je noDineroError 
        call imprimirNumero 
        imprimirString mainmsg7
        imprimirString saltoDeLinea
        call etc
        ret

        noDineroError:
            imprimirString saltoDeLinea
            imprimirString detallemsg5
            imprimirString mainmsg7
            imprimirString saltoDeLinea 
            call etc 
            ret 
    imprimir_detalles endp

    ; ######################################################################################### ;
    ;  RETIRAR DINERO                                                                           ;
    ; ######################################################################################### ;

    inputAmountCode proc 
        imprimirString saltoDeLinea
        imprimirString dineromsg5 
        imprimirString intermitente
        mov ah, 1 
        int 21h 
        mov opcionDeposito, al 
        ret 
    inputAmountCode endp

    retirar proc 
        call comprobarCuentaCreada
        imprimirString retirarmsg

        imprimirString saltoDeLinea 
        imprimirString dineromsg1
        imprimirString dineromsg2
        imprimirString dineromsg3
        imprimirString dineromsg4

        call inputAmountCode 

        cmp opcionDeposito, '1' 
        je retirar_1000 

        cmp opcionDeposito, '2' 
        je retirar_2000

        cmp opcionDeposito, '3' 
        je retirar_5000

        cmp opcionDeposito, '4' 
        jne no_retirar_10000
        jmp NEAR PTR retirar_10000 

    no_retirar_10000:

        retirar_1000:
            mov bx, montoTotal 
            cmp bx, 1000 
            jge realizar_retiro_1000
            jmp NEAR PTR limiteDinero  ; Salto largo explícito

        realizar_retiro_1000:
            sub montoTotal, 1000  
            mov ax, montoTotal   ;  Cargar AX
            call itoa
            call modificar_en_archivo   ; graba el cambio en users.txt
            imprimirString dineromsg7
            imprimirString saltoDeLinea
            jmp cuentaLoop

        retirar_2000:
            mov bx, montoTotal 
            cmp bx, 2000 
            jl limiteDinero
            sub montoTotal, 2000 
            mov ax, montoTotal   ; Cargar AX
            call itoa ; Actualizar montoStr
            call modificar_en_archivo 
            imprimirString dineromsg7
            imprimirString saltoDeLinea
            jmp cuentaLoop

        retirar_5000:
            mov bx, montoTotal 
            cmp bx, 5000 
            jl limiteDinero
            sub montoTotal, 5000 
            mov ax, montoTotal   ; Cargar AX
            call itoa ; Actualizar montoStr
            call modificar_en_archivo 
            imprimirString dineromsg7
            imprimirString saltoDeLinea
            jmp cuentaLoop
        
        retirar_10000:
            mov bx, montoTotal 
            cmp bx, 10000 
            jl limiteDinero
            mov ax, montoTotal   ; Cargar AX
            sub montoTotal, 10000 
            call itoa ; Actualizar montoStr
            call modificar_en_archivo 
            imprimirString dineromsg7
            imprimirString saltoDeLinea
            jmp cuentaLoop

        limiteDinero:
            imprimirString saltoDeLinea 
            imprimirString dineromsg6
            imprimirString mainmsg7
            imprimirString saltoDeLinea
            call etc 

        ret 
    retirar endp 

    ; ######################################################################################### ;
    ;  DEPOSITAR DINERO                                                                         ;
    ; ######################################################################################### ;


    depositar proc 
        call comprobarCuentaCreada 
        imprimirString depositarmsg;

        imprimirString saltoDeLinea 
        imprimirString dineromsg1
        imprimirString dineromsg2
        imprimirString dineromsg3
        imprimirString dineromsg4

        call inputAmountCode 

        cmp opcionDeposito, '1' 
        je depositar_1000 

        cmp opcionDeposito, '2' 
        je depositar_2000

        cmp opcionDeposito, '3' 
        je depositar_5000

        cmp opcionDeposito, '4' 
        je depositar_10000

        depositar_1000:
            add montoTotal, 1000 
            mov ax, montoTotal   ; Cargar AX
            call itoa ; Actualizar montoStr
            call modificar_en_archivo 
            imprimirString dineromsg8
            imprimirString saltoDeLinea
            jmp cuentaLoop 

        depositar_2000:
            add montoTotal, 2000 
            mov ax, montoTotal   ; Cargar AX
            call itoa ; Actualizar montoStr
            call modificar_en_archivo 
            imprimirString dineromsg8
            imprimirString saltoDeLinea
            jmp cuentaLoop 

        depositar_5000:
            add montoTotal, 5000 
            mov ax, montoTotal   ; Cargar AX
            call itoa ; Actualizar montoStr
            call modificar_en_archivo 
            imprimirString dineromsg8
            imprimirString saltoDeLinea
            jmp cuentaLoop 

        depositar_10000:
            add montoTotal, 10000 
            mov ax, montoTotal   ; Cargar AX
            call itoa ; Actualizar montoStr
            call modificar_en_archivo 
            imprimirString dineromsg8
            imprimirString saltoDeLinea
            jmp cuentaLoop 

        ret 
    depositar endp 


    ; ######################################################################################### ;
    ;  ACTUALIZAR                                                                               ;
    ; ######################################################################################### ;

    ; 1. Macro para modificar el PIN (limpiar buffer antes de escribir)
    modificar_pin macro str 
        mov si, offset str 
        mov cx, 20                  ; Longitud del buffer
        limpiar_buffer_pin:         ; Limpiar el buffer
            mov byte ptr [si], ' '
            inc si
            loop limpiar_buffer_pin

        mov si, offset str 
        mov pinCuentacount, 0
        modificar_pin_in:
            mov ah, 1
            int 21h 
            cmp al, 13 
            je mod_nombre
            inc pinCuentacount 
            mov [si], al 
            inc si 
            jmp modificar_pin_in 
    endm 

    ; 2. Macro para modificar el nombre (limpiar buffer antes de escribir)
    modificar_cuenta macro str 
        mov si, offset str 
        mov cx, 20                  ; Longitud del buffer (20 bytes)
        limpiar_buffer:             ; Limpiar el buffer antes de la nueva entrada
            mov byte ptr [si], ' '  ; Rellenar con '$' 
            inc si
            loop limpiar_buffer

        mov si, offset str          ; Resetear SI al inicio del buffer
        modificar_cuenta_in: 
            mov ah, 1 
            int 21h 
            cmp al, 13 
            je mod_telefono 
            mov [si], al 
            inc si 
            jmp modificar_cuenta_in
    endm 

    ; Macro para modificar TELÉFONO 
    modificar_telefono macro str 
        mov si, offset str 
        mov cx, 20
        limpiar_buffer_telefono:
            mov byte ptr [si], ' '
            inc si
            loop limpiar_buffer_telefono

        mov si, offset str 
        modificar_telefono_in: 
            mov ah, 1 
            int 21h 
            cmp al, 13 
            je mod_ciudad
            mov [si], al 
            inc si 
            jmp modificar_telefono_in
    endm 

    ; Macro para modificar CIUDAD 
    modificar_ciudad macro str 
        mov si, offset str 
        mov cx, 20
        limpiar_buffer_ciudad:
            mov byte ptr [si], ' '
            inc si
            loop limpiar_buffer_ciudad

        mov si, offset str 
        modificar_ciudad_in: 
            mov ah, 1 
            int 21h 
            cmp al, 13 
            je mod_dpto
            mov [si], al 
            inc si 
            jmp modificar_ciudad_in
    endm 

    ; Macro para modificar DEPARTAMENTO
    modificar_departamento macro str 
        mov si, offset str 
        mov cx, 20
        limpiar_buffer_departamento:
            mov byte ptr [si], ' '
            inc si
            loop limpiar_buffer_departamento

        mov si, offset str 
        modificar_departamento_in: 
            mov ah, 1 
            int 21h 
            cmp al, 13 
            je mod_monto
            mov [si], al 
            inc si 
            jmp modificar_departamento_in
    endm 

    ; Macro para modificar MONTO 
    modificar_monto macro str 
        mov si, offset str 
        mov cx, 20
        limpiar_buffer_monto:
            mov byte ptr [si], ' '
            inc si
            loop limpiar_buffer_monto

        mov si, offset str 
        modificar_monto_in: 
            mov ah, 1 
            int 21h 
            cmp al, 13 
            je modificar_success 
            mov [si], al 
            inc si 
            jmp modificar_monto_in
    endm 

    modificar proc 
        call comprobarCuentaCreada 
        imprimirString modificarmsg

        ; Modificar PIN
        imprimirString saltoDeLinea
        imprimirString modPinMsg1
        imprimirString pinCuenta 
        imprimirString modPinMsg2
        imprimirString intermitente
        modificar_pin pinCuenta 

    mod_nombre:
        ; Modificar nombre
        imprimirString modAccMsg1 
        imprimirString nombreCuenta 
        imprimirString modAccMsg2
        imprimirString intermitente
        modificar_cuenta nombreCuenta 

    mod_telefono:
        ;  Modificar TELÉFONO 
        imprimirString modTelMsg1
        imprimirString telefonoCuenta
        imprimirString modTelMsg2
        imprimirString intermitente
        modificar_telefono telefonoCuenta

    mod_ciudad:
        ; Modificar CIUDAD 
        imprimirString modCiuMsg1
        imprimirString ciudadCuenta
        imprimirString modCiuMsg2
        imprimirString intermitente
        modificar_ciudad ciudadCuenta

    mod_dpto:
        ; Modificar DEPARTAMENTO 
        imprimirString modDptoMsg1
        imprimirString dptoCuenta
        imprimirString modDptoMsg2
        imprimirString intermitente
        modificar_departamento dptoCuenta

    mod_monto:
        ; Modificar MONTO 
        imprimirString modMontoMsg1
        imprimirString montoStr
        imprimirString modMontoMsg2
        imprimirString intermitente
        modificar_monto montoStr

    modificar_success:
        call atoi            ; Convierte montoStr a AX
        mov montoTotal, ax   ; Guarda el valor convertido
        mov ax, montoTotal   ; Cargar AX para itoa
        call itoa            ; Generar cadena correcta

        call modificar_en_archivo
        mov si, offset recordBuffer+100
        mov cx, 19
        call imprimir_buffer   ; muestra exactamente los 19 bytes del monto

        imprimirString modSuccess 
        call verificarCuenta    
        call etc 
        ret 
    modificar endp 


    modificar_en_archivo proc
        ; Este procedimiento sobrescribe el registro actual en users.txt

        ; 1. Abrir archivo en modo lectura/escritura
        mov ah, 3Dh
        mov al, 2              
        lea dx, filename
        int 21h
        jnc continuar_abrir
        jmp NEAR PTR error_abriendo 

    continuar_abrir:
        mov handle, ax

        ; 2. Obtener número del registro a modificar
        mov ax, registroActual
        dec ax                  ; porque lo empezamos en 1
        mov bx, 122             ; tamaño fijo del registro
        mul bx                 ; DX:AX = registroActual * 122

        ; Pasar resultado de MUL a CX:DX
        mov cx, dx             ; offset alto
        mov dx, ax             ; offset bajo

        ; 3. Mover puntero del archivo
        mov ah, 42h
        mov al, 0             
        mov bx, handle
        int 21h
        jnc continuar_seek
        jmp NEAR PTR error_seek 
        
    continuar_seek:

        ; 4. Preparar recordBuffer puro: 6 campos ×19 bytes, luego CRLF
        ; — PIN (19 bytes) —
        mov cx,19
        lea si, pinCuenta
        lea di, recordBuffer
        rep movsb
        ; Rellenar hasta 20
        mov byte ptr [recordBuffer+19], ' '

        ; — Nombre (19 bytes) —
        mov cx,19
        lea si, nombreCuenta
        lea di, recordBuffer+20
        rep movsb
        mov byte ptr [recordBuffer+39], ' '

        ; — Teléfono (19 bytes) —
        mov cx,19
        lea si, telefonoCuenta
        lea di, recordBuffer+40
        rep movsb
        mov byte ptr [recordBuffer+59], ' '

        ; — Ciudad (19 bytes) —
        mov cx,19
        lea si, ciudadCuenta
        lea di, recordBuffer+60
        rep movsb
        mov byte ptr [recordBuffer+79], ' '

        ; — Departamento (19 bytes) —
        mov cx,19
        lea si, dptoCuenta
        lea di, recordBuffer+80
        rep movsb
        mov byte ptr [recordBuffer+99], ' '

        ; — Monto (19 bytes) —
        mov cx, 20
        lea si, montoStr
        lea di, recordBuffer+100
        rep movsb

        ; ... tras llenar recordBuffer con los 6 campos de 20 bytes ...
        mov byte ptr [recordBuffer+120], 13   ; CR
        mov byte ptr [recordBuffer+121], 10   ; LF

        ; 5. Escribir en el archivo los 122 bytes completos
        mov ah, 40h
        mov bx, handle
        lea dx, recordBuffer
        mov cx, 122
        
        int 21h
        jc error_escribiendo

        ; 6. Cerrar archivo
        mov ah, 3Eh
        mov bx, handle
        int 21h
        ret

    error_abriendo:
        imprimirString msg_abierto
        ret

    error_seek:
        imprimirString msg_buscar
        ret

    error_escribiendo:
        imprimirString msg_escribir
        ret
    modificar_en_archivo endp

    ; ######################################################################################### ;
    ;  ENTRADA DE DATOS                                                                         ;
    ; ######################################################################################### ;
    Main proc 
        mov ax, @data
        mov ds, ax
        push ds
        pop es
 

        call limpiarPantalla
        call displaySub
        imprimirString saltoDeLinea
        
        mainLoop:
            call limpiarTecladoBuffer
            
            call mostrarMenuPrincipal
            call limpiarTecladoBuffer
            imprimirString saltoDeLinea
            call inputMenu 

            cmp inputCode, '0' 
            je salir 

            cmp inputCode, '1'
            jne no_crear_cuenta
            jmp NEAR PTR crear_cuenta

        no_crear_cuenta:

            cmp inputCode, '2'
            je intentarLogin

            jmp mainLoop

        intentarLogin:
            call verificarCuenta      ; Retorna AX=1 (éxito) o AX=0 (fallo)
            cmp ax, 1
            jne fallo_login          ; Si falló, ir a manejo de error
            call cuentaLoop          ; Si tuvo éxito, entrar al menú de cuenta
            jmp mainLoop            ; Solo después de salir de cuentaLoop, volver al menú principal

        fallo_login:
            jmp mainLoop            ; Vuelve al menú principal si el login falló

        cuentaLoop:
            call mostrarMenuCuenta
            call inputMenu

            cmp inputCode, '0'
            je exit_cuenta

            cmp inputCode, '1'
            jne no_imprimir_detalles
            jmp NEAR PTR imprimir_detalles

        no_imprimir_detalles:


            cmp inputCode, '2'
            jne no_retirar
            jmp NEAR PTR retirar
            
        no_retirar:

            cmp inputCode, '3'
            jne no_depositar
            jmp NEAR PTR depositar
        
        no_depositar:

            cmp inputCode, '4'
            jne no_modificar
            jmp NEAR PTR modificar

        no_modificar:

            jmp cuentaLoop

        exit_cuenta:
            call limpiarPantalla 
            ret    

        salir:
            imprimirString saltoDeLinea 
            imprimirString saltoDeLinea 
            call mostrarAdios
            imprimirString saltoDeLinea
            imprimirString saltoDeLinea

            mov ah,4ch
            int 21h
        main endp 
    end main
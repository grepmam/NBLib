section .data

section .text
    global atoi, exit

;------------------------------------------------------------------------------
;
; [ ATOI Function ]
;
; Brief: Converts a string to an integer. 
;
; Details: converts the string pointed to an integer value. For now it is 
; limited to unsigned numbers
;
; Declaration in C: int atoi(char *str)
;
; @param [ebp+8] Pointer to the character string to be converted.
;
; @return eax The integer value represented by the string, or 0 if it cannot be
;
;------------------------------------------------------------------------------

atoi:

    push ebp
    mov ebp, esp

    sub esp, 4

    mov esi, [ebp+8]
    mov byte [ebp-4], 0      ; result = 0

.loop:                       ; while ( 

    cmp byte [esi], 0        ;   *string != '\0' &&
    je .end

    cmp byte [esi], '0'      ;   *string > '0' &&
    jl .end

    cmp byte [esi], '9'      ;   *string < '9'
    jg .end                  ; ) {

    mov eax, [ebp-4]
    mov ecx, 10
    mul ecx
    mov [ebp-4], eax         ;     result = result * 10;

    movzx eax, byte [esi]
    sub eax, '0'
    add [ebp-4], eax         ;     result = result + (*string - '0');

    inc esi                  ;     string++;
    jmp .loop                ; }

.end:

    mov eax, [ebp-4]         ; number = result;

    add esp, 4

    mov esp, ebp
    pop ebp
    ret                      ; return number


;------------------------------------------------------------------------------
;
; [ EXIT Function ]
;
; Brief: Terminates the execution of the current program. 
;
; Details:  The `exit` function terminates the execution of the current program 
; and returns the value specified as an argument. This function is provided by 
; the operating system and can be called from an assembly program via interrupt 0x80. 
;
; Declaration in C: void exit(int status) 
;
; @param ebx status
;
; @return None
;
;------------------------------------------------------------------------------

exit:

    mov eax, 1 
    int 0x80

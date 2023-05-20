section .data

section .text
    global strlen, strcat, strcpy, strrev

;------------------------------------------------------------------------------
;
; [ STRLEN Function ]
;
; Brief: Calculates the length of a character string.
;
; Details: calculates the length of the string passed as an argument. 
;
; Declaration in C: int strlen(char *string)
;
; @param [ebp+8] Pointer to the character string
;
; @return eax The length of the string, excluding the null character.
;
;------------------------------------------------------------------------------

strlen:

    push ebp
    mov ebp, esp

    mov ebx, [ebp+8]        ; char *string
    mov esi, 0              ; i = 0

.loop:                      ; while (

    cmp byte [ebx+esi], 0   ;  *(string+i) != '\0' ) { 
    je .end                 ;
    inc esi                 ;     i++;
    jmp .loop               ; }

.end:

    mov eax, esi            ; length = i

    mov esp, ebp
    pop ebp

    ret                     ; return length


;------------------------------------------------------------------------------
;
; [ STRCPY Function ]
;
; Brief: Copy a string from origin to destiny. 
;
; Details: copies the string pointed to by origin (including the terminating 
; null character) to the array pointed to by destiny. The strings may not 
; overlap, and the destiny array must be large enough to receive the copy. 
; If the destination string is not large enough, then the behavior is undefined. 
; If the strings overlap, then the behavior is undefined. 
;
; Declaration in C: void strcpy(char *dst, char *src)
;
; @param [ebp+8] Pointer to the destination array where the content is to be copied.
; @param [ebp+12] Pointer to the source of data to be copied.
;
; @return None
;
;------------------------------------------------------------------------------

strcpy:

    push ebp
    mov ebp, esp

    mov ecx, [ebp+8]           ; char *dst
    mov ebx, [ebp+12]          ; char *src
    mov esi, 0                 ; i = 0;

.loop:                         ; while (

    cmp byte [ebx+esi], 0      ;   *(src+i) != '\0'
    je .end                    ; ) {

    mov al, byte [ebx+esi]     ;     *(dst+i) = *(src+i);
    mov byte [ecx+esi], al     ;

    inc esi                    ;     i++

    jmp .loop                  ; }

.end:

    mov esp, ebp
    pop ebp

    ret


;------------------------------------------------------------------------------
;
; [ STRCAT Function ]
;
; Brief: Concatenates the string *src to the end of the string *dst. 
;
; Details: This function copies the string *src to the end of the string *dst, 
; overwriting the null character of *dst. The string *dst must be large enough 
; to contain both strings. 
;
; Declaration in C: void strcat(char *dst, char *src)
;
; @param [ebp+8] Pointer to the start of the destination string.
; @param [ebp+12] Pointer to the start of the source string.
;
; @return None
;
;------------------------------------------------------------------------------

strcat:

    push ebp
    mov ebp, esp

    mov edi, [ebp+8]     ; *dst
    mov esi, [ebp+12]    ; *src

.loop:                   ; while (

    cmp byte [edi], 0    ;   *dst != '\0'
    je .loop2            ; ) {
    
    inc edi              ;    dst++;

    jmp .loop            ; }

.loop2:                  ; while (

    cmp byte [esi], 0    ;   *src != '\0'
    je .end              ; ) {

    mov al, [esi]        ;    *dest = *src;
    mov byte [edi], al   ;

    inc esi              ;    esi++;
    inc edi              ;    edi++;

    jmp .loop2           ; }

.end:
    
    mov byte [edi], 0    ; *dest = '\0';

    mov esp, ebp
    pop ebp

    ret


;------------------------------------------------------------------------------
;
; [ STRREV Function ]
;
; Brief: Reverse a string in place. 
;
; Details: This function reverses a given null-terminated string in place by 
; swapping the characters at both ends of the string. The function uses the 
; XCHG assembly instruction to swap the values of two bytes without using a 
; temporary variable. 
;
; Declaration in C: void strrev(char* str)
;
; @param [ebp+8] Pointer to the null-terminated string to reverse
;
; @return none
;
;------------------------------------------------------------------------------

strrev:

    push ebp
    mov ebp, esp

    mov ebx, [ebp+8]        ; *str

    push ebx
    call strlen             ;

                            ; for (
    mov esi, 0              ;   i = 0,
    dec eax
    mov edi, eax            ;   j = strlen(str) - 1;

.loop:

    cmp esi, edi            ;   i < j; i++, j--
    jg .end                 ; ) {
    
    ; this part is kind of ugly to explain :P

    mov al, byte [ebx+edi]  ;     temp = str[j]
    xchg [ebx+esi], al      ;     str[i] <=> temp => str[i] = temp ^ temp = str[i]
    xchg [ebx+edi], al      ;     str[j] <=> temp => str[j] = temp ^ temp = str[j]

    inc esi
    dec edi

    jmp .loop               ; }

.end:

    mov esp, ebp
    pop ebp

    ret

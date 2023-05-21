section .data

section .text
    global sprint, sread

;------------------------------------------------------------------------------
;
; [ SPRINT Function ]
;
; Brief: Prints a string to standard output
;
; Details: This function loops through the string specified by the pointer
; passed as a parameter until the null character '\0' is found. Then use
; the 'write' system call to print the string to standard output.
;
; Declaration in C: void sprint(char *string)  
;
; @param [ebp+8] Pointer to the character string
;
; @return None
;
;------------------------------------------------------------------------------

sprint:
    
    push ebp
    mov ebp, esp
    
    mov ecx, [ebp+8]             ; char *string
    mov esi, 0                   ; i = 0

.loop:                           ; while (
    
    cmp byte [ecx+esi], 0        ;   *(string+i) != '\0' ) {
    je .end                      ;
    inc esi                      ;    i++;
    jmp .loop                    ; }

.end:
    
    mov eax, 4                   ; write(
    mov ebx, 1                   ;  STDOUT_FD,
    mov edx, esi                 ;  string, i
    int 0x80                     ; );
    
    mov esp, ebp
    pop ebp

    ret


;------------------------------------------------------------------------------
;
; [ SREAD Function ]
;
; Brief: Reads a string from standard input
;
; Details: This function uses the 'read' system call to read a string from
; characters from standard input. The string is stored in the buffer
; specified by the pointer passed as a parameter. The function changes the 
; last character read ('\n') to a null character ('\0').
;
; Declaration in C: void sread(char *buff, int size)
;
; @param [ebp+8] Pointer to the destination buffer where the string will be stored
; @param [ebp+12] 
;
; @return None
;
;------------------------------------------------------------------------------

sread:

    push ebp
    mov ebp, esp

    mov eax, 3               ; read(
    mov ebx, 0               ;    STDIN_FD,
    mov ecx, [ebp+8]         ;    buff,
    mov edx, [ebp+12]        ;    size
    int 0x80                 ; );
 
    add ecx, eax             ;
    dec ecx                  ; string--;
    mov byte [ecx], 0        ; *string = '\0';
 
    mov esp, ebp
    pop ebp

    ret

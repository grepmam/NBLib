
extern strlen 
%macro strlen 1
    push ebp
    mov ebp, esp

    mov eax, %1

    push eax
    call strlen

    mov esp, ebp
    pop ebp
%endmacro

extern strcpy 
%macro strcpy 2
    push ebp
    mov ebp, esp

    mov eax, %1
    mov ecx, %2

    push ecx
    push eax
    call strcpy

    mov esp, ebp
    pop ebp
%endmacro

extern strcat
%macro strcat 2
    push ebp
    mov ebp, esp

    mov eax, %1
    mov ecx, %2

    push ecx
    push eax
    call strcat

    mov esp, ebp
    pop ebp
%endmacro

extern strrev
%macro strrev 1
    push ebp
    mov ebp, esp

    mov eax, %1

    push eax
    call strrev

    mov esp, ebp
    pop ebp
%endmacro

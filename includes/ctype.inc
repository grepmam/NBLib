
extern toupper
%macro toupper 1
    push ebp
    mov ebp, esp

    mov ebx, %1

    push ebx
    call toupper

    mov esp, ebp
    pop ebp
%endmacro

extern tolower
%macro tolower 1
    push ebp
    mov ebp, esp

    mov ebx, %1

    push ebx
    call tolower

    mov esp, ebp
    pop ebp
%endmacro

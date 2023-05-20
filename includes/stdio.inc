
extern sprint
%macro sprint 1
    push ebp
    mov ebp, esp

    mov eax, %1

    push eax
    call sprint

    mov esp, ebp
    pop ebp
%endmacro

extern sread
%macro sread 2
    push ebp
    mov ebp, esp

    mov eax, %1
    mov ecx, %2

    push ecx
    push eax
    call sread

    mov esp, ebp
    pop ebp
%endmacro


extern atoi
%macro atoi 1
    push ebp
    mov ebp, esp

    mov eax, %1

    push eax
    call atoi

    mov esp, ebp
    pop ebp
%endmacro

extern exit
%macro exit 1
    push ebp
    mov ebp, esp

    mov ebx, %1
    call exit

    mov esp, ebp
    pop ebp
%endmacro

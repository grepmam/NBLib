section .data

section .text
    global toupper, tolower

toupper:

    push ebp
    mov ebp, esp

    mov ebx, [ebp+8]

.loop:

    cmp byte [ebx], 0
    je .end
    
    cmp byte [ebx], 61h
    jb .pass_to_inc

    cmp byte [ebx], 7ah
    ja .pass_to_inc

    and byte [ebx], 11011111b

.pass_to_inc:

    inc ebx 
    jmp .loop

.end:

    mov esp, ebp
    pop ebp
    ret


tolower:

    push ebp
    mov ebp, esp

    mov ebx, [ebp+8]

.loop:

    cmp byte [ebx], 0
    je .end
    
    cmp byte [ebx], 41h
    jb .pass_to_inc

    cmp byte [ebx], 5Ah
    ja .pass_to_inc

    or byte [ebx], 00100000b

.pass_to_inc:

    inc ebx 
    jmp .loop

.end:

    mov esp, ebp
    pop ebp
    ret

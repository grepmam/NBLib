%include 'stdio.inc'
%include 'stdlib.inc'
%include 'string.inc'

section .data

    str1 db 'Hola ', 0
    str2 db 'Mundo!', 0

section .text

    global _start

_start:

    strcat str1, str2

    sprint str1

    exit 0

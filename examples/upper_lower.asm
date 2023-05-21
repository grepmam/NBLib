%include 'stdio.inc'
%include 'stdlib.inc'
%include 'ctype.inc'

section .data

    string1 db 'test upper. you will like it :)', 0ah, 0
    string2 db 'TEST LOWER. NOW, SHUT UP >:V', 0

section .text
    global _start

_start:

    toupper string1
    sprint string1

    tolower string2
    sprint string2

    exit 0

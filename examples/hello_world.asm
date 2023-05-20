%include 'stdio.inc'
%include 'stdlib.inc'

section .data

    string db 'Hello World!', 0

section .bss

section .text
    global _start

_start:
     
    sprint string

    exit 0

%include 'stdio.inc'
%include 'stdlib.inc'

section .data

    input_string db '(string)>> ', 0

section .bss
    
    string resb 20

section .text

    global _start

_start:

    sprint input_string

    sread string, 20

    sprint string

    exit 0

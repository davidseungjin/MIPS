.data
		mycharacter: .byte 'm'

.text
.globl main
main:
		li $v0, 4
		la $a0, mycharacter
		syscall

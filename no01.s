.data
# all the variable
		mymessage: .asciiz "Hello World \n"

.text
# all the intruction I need
.globl main
main:
		li $v0, 4
		la $a0, mymessage
		syscall


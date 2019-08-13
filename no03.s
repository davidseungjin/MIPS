

.data
		age: .word 23

.text

.globl main
main:
		li $v0, 1
		lw $a0, age
		syscall

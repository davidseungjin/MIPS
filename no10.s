

.data

.text

.globl main
main:
		addi $s0, $zero, 4

		sll $t0, $s0, 2			# same effect of multiply 4, 2^x <-- power of two
		
		# print it

		li $v0, 1
		add $a0, $zero, $t0
		syscall

.data

.text


.globl main
main:
		addi $t0, $zero, 30
		addi $t1, $zero, 6

		div $t0, $t1

		mflo $s0 # Quotient
		mfhi $s1 # remainder

		#print it

		li $v0, 1
		add $a0, $zero, $s1
		syscall

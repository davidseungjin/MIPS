.data
		# for data

.text
		# for instruction

.globl main
main:
		addi $t0, $zero, 2000
		addi $t1, $zero, 10

		mult $t0, $t1

		mflo $s0

		# Displays the product to the screen.
		li $v0, 1
		add $a0, $zero, $s0
		syscall


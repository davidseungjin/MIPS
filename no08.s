.data


.text
		

.globl main
main:
		addi $s0, $zero, 10
		addi $s1, $zero, 4

		mul $t0, $s0, $s1

		# Display the product.
		li $v0, 1
		add $a0, $zero, $t0
		syscall

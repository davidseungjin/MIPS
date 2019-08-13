.data
		message: .asciiz "Hi, everyone \n My name is David \n"

.text
		main:
				addi $a1, $zero, 50
				addi $a2, $zero, 100

				

				jal addnumbers
				li $v0, 1
				addi $a0, $v1, 0
				syscall

		# tell the system that the program is done
		li $v0, 10
		syscall

		addnumbers:
				add $v1, $a1, $a2
				jr $ra


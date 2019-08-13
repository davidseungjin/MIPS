.data
		newline:		.asciiz "\n"



.text
		main:
				addi $s0, $zero, 10

				jal increasemyregister

				# print a line
				li $v0, 4
				la $a0, newline
				syscall

				#print value
				li $v0, 1
				move $a0, $s0
				syscall

				jal printthevalue

		# this line is going to signal end of program
		li $v0, 10
		syscall

		increasemyregister:
				addi $sp, $sp, -8			# why -4? we have to allocate 4 bytes. 
				sw $s0, 0($sp)		# sw -> store word, save the value to 
													# the first location/position of stack pointer
				sw $ra, 4($sp)


				# nested procedure
				jal printthevalue

				lw $s0, 0($sp)
				lw $ra, 4($sp)
				addi $sp, $sp, 4

				jr $ra

		printthevalue:
				# print new value in function
				li $v0, 1
				move $a0, $s0
				syscall

				jr $ra

.data
		message: .asciiz "Hi, everybody. \nMyname is David.\n"

.text

.globl main
		main:
			jal displaymessage		




		# Tell the system that the program is done
		li $v0, 10
		syscall





		displaymessage:
			li $v0, 4
			la $a0, message
			syscall

			jr $ra

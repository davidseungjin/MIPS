.data
		prompt1:		.asciiz		"Enter the first number: \n"
		prompt2:		.asciiz		"Enter the second number: \n"
		prompt3:				.asciiz		"Enter the nubmer 1: add, 2: subtract, 3: multiply: \n"
		resulttext:	.asciiz		"\nYour final result is: \n"

.text
.globl main
main:
		li $t3, 1
		li $t4, 2
		li $t5, 3

		# asking the user to provide the first number
		li $v0, 4					# command for printing a string
		la $a0, prompt1		# loading the string to print into the argument to enable printing
		syscall						# executing the command

		# the next block of code is for reading the first number provided by the user
		li $v0, 5					# command for reading an integer
		syscall						# executing the command for reading an integer
		li $t0, 5
#		move $t0, $v0			# moving the number read from the user input into the temporary register $t0

		# asking the user to provide the second number
		li $v0, 4					# command for printing a string
		la $a0, prompt2		# loading the string into the argument to enable printing
		syscall						# executing the command

		# reading the second number to be provided to the user
		li $v0, 5					# command to read the nubmber provided to the user
		syscall						# executing the command for reading an integer
		li $t1, 3
#		move $t1, $v0			# moving the number read from the user input into the temporary register $t1

		li $v0, 4					# command for printing a string
		la $a0, prompt3		# loading the string into the argument to enable printing 
		syscall						# executing the command

		# the next block of code is to read the number provided by the user
		li $v0, 5					# command for reading an integer
		syscall						# exeuting the command
		move $t2, $v0			# this command is to move the integer provided into the $t2

		#the following lines of code determine what should take place depending on the integer provided by user
		beq $t2, $t3, addprocess				# branch to subprocess if $t2 = $t3
		beq $t2, $t4, subtractprocess		# branch to subprocess if $t2 = $t4
		beq $t2, $t5, multiplyprocess	# branch to subprocess if $t2 = $t5

addprocess:
		add $t6, $t0, $t1	# this adds the values stored in $t0, $t1 and assign the value in $t6

		#the following line of code is to print resulting statement.
		li $v0, 4						# this is the command for printing a string
		la $a0, resulttext	# this loads the string to print into the argument
		syscall						# executes the command

		#this following line of code prints out the result of the addition
		li $v0, 1
		la $a0, ($t6)
		syscall

		li $v0, 10

subtractprocess:
		sub $t6, $t0, $t1		#this do subtract and assign the value into $t6

		li $v0, 4		#this is the command for printing a string
		la $a0, resulttext	# this loads the string to print
		syscall			# executes the command

		#the following line of code prints out the result of the subtract
		li $v0, 1
		la $a0, ($t6)
		syscall

		li $v0, 10		# this is termination

multiplyprocess:
		mul $t6, $t0, $t1

		li $v0, 4
		la $a0, resulttext
		syscall

		li $v0, 1
		la $a0, ($t6)
		syscall

		li $v0, 10

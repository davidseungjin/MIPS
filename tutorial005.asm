## addsome
## program to demonstrate addition
		.text
		.globl main

main:
		ori		$8, $0, 0xAB		# put 0x000000AB into $8
		ori		$9, $0, 0x55		# put 0x00000055 into $9
		addu	$10, $9, $8			# put the result of add operation into $10

# end of file

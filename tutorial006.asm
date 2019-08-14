## handmadeneg
## the program adds +146 -82, leaving the result in $10

		.text
		.globl main

main:
		ori 	$7, $0, 146		# put +146 into $7
		ori		$8, $0, 82		# put 82 into $8
		nor		$8, $8, $0		# reflect
		ori		$9, $0, 1			#
		addiu	$8, $8, $9		# add 1: $8 = -82
		addiu	$10, $7, $8		# +146 + (-82)

#end of fiole

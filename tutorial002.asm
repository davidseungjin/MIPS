## Program to bitwise OR two patterns
		.text
		.globl main

main:
		ori		$8, $0, 0x0fa5			# put first pattern into register $8
		ori		$10, $8, 0x368f			# or ($8) with second pattern. result to $10
		xori	$9, $0, 0x0fa5					# xor
		andi	$15, $10, 0x0fa5

## End of file


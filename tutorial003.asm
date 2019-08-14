## shifttwo
## program to logical shift left a pattern

		.text
		.globl main

main:
		ori		$8, $0, 0x6f
		sll		$9, $8, 31
		sll		$0, $8, 2
		or		$10, $8, $9
		nor		$11, $8, $9
		and		$12, $10, $8
		xor		$13, $10, $9

#		sll		$10, $9, 2
#		sll		$11, $10, 2
#		sll		$12, $11, 2
#		sll		$13, $12, 2
#		sll		$14, $13, 2
#		sll		$15, $14, 2


## end of file


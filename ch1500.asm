## evaluate 5x^2 - 12x + 97
##


			.text
			.globl main

main:


			## many instructions


			.data
											# In SPIM, the data section
											# starts at address 0x1000000

x:		.word		17			# The base register points here.
poly:	.word		0


## End of file

# The assembler directive .data means: here is the start of the data section of memory.
# The assembler directive .word means "put a 32-bit two's complement integer here
# the integer is specified using base 10


# in above, the .word 17 calls for a 32-bit two's complement representation of an 
# integer that in base 10 is 17
# The assembler converts the representation into the appropriate bit pattern
# you can also specify the bit pattern using the hexadecimal name for the pattern
# .word 0x11 does exactly the same thing as .word 17


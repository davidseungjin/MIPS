## Program to add two plus three
		.text
		.globl main
main:
		ori $8, $0, 0x2		#put two's comp. two into register 8
		ori $9, $0, 0x3		#put tow's comp. three into register 9
		addu $10, $8, $9	#add reg 8 and reg 9, put result in reg 10

## End of file

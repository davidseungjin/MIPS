## test lui operation, which is load upper immediate

.text
.globl main

main:
		lui		$13, 0x0004
		lw		$12, 0x10($13)



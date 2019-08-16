## move data between the coprocessor and the CPU

			.text
			.globl main

main:
			li			$t0, 1			# $t0 <-- 1
													# move to the coprocessor
			mtc1		$t0, $f0		# $f0 <-- $t0

			li.s		$f1, 1.0		# $f1 <-- 1.0
													# move from the coprocessor
			mfc1		$t1, $f1		# $t1 <-- $f1

			li			$v0, 10			# exit
			syscall


## See QtSPIM in the section of FG registers
## t1, and fg1 will be have same bit patterns.
## In addition, $1 ($at) also have same pattern 
## it's not due to copy, but it was engaged to the operations

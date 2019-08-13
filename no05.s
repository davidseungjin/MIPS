.data
		mydouble:		.double 7.202
		zerodouble:	.double 0.0

.text

.globl main
main:
		ldc1	$f2, mydouble
		ldc1 	$f0, zerodouble

		li 		$v0, 3
		add.d	$f12, $f2, $f0
		syscall


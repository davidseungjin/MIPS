## swap
##
## exchange the values in vala and valb

			.text
			.globl main


main:
			l.s			$f0, vala			# $f0 <-- vala
			l.s			$f1, valb			# $f1 <-- valb
			s.s			$f0, valb			# $f0 --> valb
			s.s			$f1, vala			# $f1 --> vala

			li			$v0, 10				# code 10 --> exit
			syscall


			.data
vala:	.float	8.32					# 32bit floating point value
valb:	.float	-0.6234e4			# 32bit floating point value
														# small 'e' only


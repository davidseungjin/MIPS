## branch delay slots not filled

init: ori		$8, $0, 0		#count = 0

test:	sltiu	$9, $8, 10	#count <10
			beq		$9, $0, endlp
			sll		$0, $0, 0

			addiu	$8, $8, 1		# count++;
			j			test
			sll		$0, $0, 0

endlp:
			sll		$0, $0, 0		# branch target


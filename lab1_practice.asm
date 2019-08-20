

			.data
			.text

			.globl main

main:
				li			$t0, 23
				li			$t1, 0xAAAAAAAA
				li			$t2, 0x55555555
				and			$t1, $t1, $t0
				srl			$t1, $t1, 1
				and			$t2, $t2, $t0
				sll			$t2, $t2, 1
				or			$t0, $t1, $t2




#                                           ICS 51, Lab #1
# 
#                                          IMPORTATNT NOTES:
# 
#                       Write your assembly code only in the marked blocks.
# 
#                       DO NOT change anything outside the marked blocks.
# 
#                      Remember to fill in your name, student ID in the designated sections.
# 
#

###############################################################
#                           Data Section
.data
# 
# Fill in your name, student ID in the designated sections.
# 
student_name: .asciiz "SEUNGJIN LEE"
student_id: .asciiz "49607024"

new_line: .asciiz "\n"
space: .asciiz " "
double_range_lbl: .asciiz "Double range (Decimal Values) \n"
swap_bits_lbl: .asciiz "Swap bits (Hexadecimal Values)\n"

swap_bits_test_data:  .word 0xAAAAAAAA, 0x01234567, 0xFEDCBA98, 0x0, 0xFFFFFFFF
swap_bits_expected_data:  .word 0x555555555, 0x02138A9B, 0xFDEC7564, 0x0, 0xFFFFFFFF

double_range_test_data: .word     80000, 111,    0, -111, -11, -10, 10
double_range_expected_data: .word        160000, 0, -222, -242, -2

hex_digits: .byte '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'

###############################################################
#                           Text Section
.text
# Utility function to print hexadecimal numbers
print_hex:
move $t0, $a0
li $t1, 8 # digits
lui $t2, 0xf000 # mask
mask_and_print:
# print last hex digit
and $t4, $t0, $t2 
srl $t4, $t4, 28
la    $t3, hex_digits  
add   $t3, $t3, $t4 
lb    $a0, 0($t3)            
li    $v0, 11                
syscall 
# shift 4 times
sll $t0, $t0, 4
addi $t1, $t1, -1
bgtz $t1, mask_and_print
exit:
j $ra

###############################################################
###############################################################
###############################################################
#                            PART 1 (Swap Bits)
# 
# You are given an 32-bits integer stored in $t0. You need swap the bits
# at odd and even positions. i.e. b31 <-> b30, b29 <-> b28, ... , b1 <-> b0
# The result must be stored inside $t0 as well.
swap_bits:
move $t0, $a0 
############################## Part 1: your code begins here ###

li	$t1, 0xAAAAAAAA
li	$t2, 0x55555555
and	$t1, $t1, $t0
srl	$t1, $t1, 1
and	$t2, $t2, $t0
sll	$t2, $t2, 1
or	$t0, $t1, $t2

############################## Part 1: your code ends here ###
move $v0, $t0
jr $ra
###############################################################
###############################################################
###############################################################
#                           PART 2
# 
# You are given three integers. You need to find the smallest 
# one and the largest one and multiply their sum by two and return it.
# 
# Implementation details:
# The three integers are stored in registers $t0, $t1, and $t2. You 
# need to store the answer into register $t0. It will be returned by the
# function to the caller.

double_range:
move $t0, $a0
move $t1, $a1
move $t2, $a2
############################### Part 2: your code begins here ##

	blt		$t0, $t1, comp1
	blt		$t2, $t0, comp4
	move	$t3, $t1						
	move	$t4, $t2						# $t1 / $t0 / $t2
	j			cal

comp1:
	blt		$t1, $t2, comp2
	blt		$t2, $t0, comp3
	move	$t3, $t0						# case 2: min/ mid/ max is
	move	$t4, $t1						# $t0 / $t2 / $t1
	j			cal

comp2:
	move	$t3, $t0						# case 1: min/ mid/ max is
	move	$t4, $t2						# $t0 / $t1 / $t2
	j			cal

comp3:
	move	$t3, $t2						# case 3
	move	$t4, $t1						# $t2 / $t0 / $t1
	j			cal

comp4:
	blt		$t2, $t1, comp5
	move	$t3, $t1						# case 5
	move	$t4, $t0						# $t1 / $t2 / $t0
	j			cal

comp5:
	move	$t3, $t2						# case 4
	move	$t4, $t0						# $t2 / $t1 / $t0
	j			cal

cal:
	add		$t0, $t3, $t4				# (min + max)
	sll		$t0, $t0, 1					# multiply by 2

############################### Part 2: your code ends here  ##
move $v0, $t0
jr $ra
###############################################################
###############################################################
###############################################################
#                          Main Function 
main:

li $v0, 4
la $a0, student_name
syscall
la $a0, new_line
syscall  
la $a0, student_id
syscall 
la $a0, new_line
syscall

la $a0, swap_bits_lbl
syscall

# Testing part 1
li $s0, 5 # num of test cases
li $s1, 0
la $s2, swap_bits_test_data

test_p1:
add $s4, $s2, $s1
# Pass input parameter
lw $a0, 0($s4)
jal swap_bits

move $a0, $v0
jal print_hex
li $v0, 4
la $a0, space
syscall

addi $s1, $s1, 4
addi $s0, $s0, -1
bgtz $s0, test_p1

li $v0, 4
la $a0, new_line
syscall
la $a0, double_range_lbl
syscall


# Testing part 2
li $s0, 5 # num of test cases
li $s1, 0
la $s2, double_range_test_data

test_p2:
add $s4, $s2, $s1
# Pass input parameter
lw $a0, 0($s4)
lw $a1, 4($s4)
lw $a2, 8($s4)
jal double_range

move $a0, $v0        # $integer to print
li $v0, 1
syscall

li $v0, 4
la $a0, space
syscall

addi $s1, $s1, 4
addi $s0, $s0, -1
bgtz $s0, test_p2

_end:
# end program
li $v0, 10
syscall


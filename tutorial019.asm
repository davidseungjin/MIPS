# While the subroutine is active the frame pointer points at the top of the stack.
# (Remember, our stacks grow downward, so in the picture $fp is correctly pointing at the
# last word that was pushed onto the stack, the top of the stack
# But the stack may be involved in arithmetic expression evaluation
# This often involves pushing and popping values onto and off of the stack
# If $sp keeps changing it would be hard to access a variable at a fixed location
# on the stack.
# To make things easy for compilers (and for human assembly language programmers)
# it is convenient to have a frame pointer that does not change its value while
# a subroutine is active
# The variables will always be the same distance from the unchanging
# frame pointer
# In the subroutine prolog, the cller's frame pointer is pushed onto the stach along with
# the stack pointer and any S register
# Now the subroutine makes room on the sack for variables and points the frame pointer to
# the top of the stack frame



lw			$t0, 8($fp)			# get b
lw			$t1, 4($fp)			# get i
lw			$t2, 0($fp)			# get j
addu		$t3, $t0, $t1		# b + i
addu		$t3, $t3, $t2		# (b + i) + j
sw			$t3, 12($fp)		# a = 


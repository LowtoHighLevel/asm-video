# Math utilities

# Shift Right
# r1 - register to shift
shr:
	add r0 r0 r0
	ror r1 r1
	ret r26

# Shift Left
# r1 - register to shift
shl:
	add r0 r0 r0
	rol r1 r1
	ret r26

	
	# Multiply
	# r1 - multiplicand
	# r2 - Multiplier
	# r3 - result
multiply:
	# store non-output registers to the stack
	write r30 r4
	sub r30 r30 r28
	write r30 r2
	sub r30 r30 r28
	write r30 r1
	sub r30 r30 r28
	
	# init result to 0
	ld r3 0
	ld r4 1
multiply_loop:
	and r0 r2 r4
	jz mult_not_add
	add r3 r3 r1
mult_not_add:
	# shift multiplicand to the left
	call shl

	# shift the multiplier to the right
	add r0 r0 r0
	ror r2 r2

	# repeat while the multiplier is not 0
	jz multiply_done
	j multiply_loop

multiply_done:
	add r30 r30 r28
	read r30 r1
	add r30 r30 r28
	read r30 r2
	add r30 r30 r28
	read r30 r4
	ret r26

# Divide
# r1 - Dividend
# r2 - Divisor
# r3 - Quotient
# r4 - Remainder
divide:
	# Store used registers
	write r30 r7
	sub r30 r30 r28
	write r30 r6
	sub r30 r30 r28
	write r30 r5
	sub r30 r30 r28
	write r30 r2
	sub r30 r30 r28
	write r30 r1
	sub r30 r30 r28

	# set up quotient and remainder
	ld r4 0
	mov r3 r1

	# run 32 times (32 bit system)
	ld r6 32
div_loop:

	# shl r3r4
	add r0 r0 r0
	rol r3 r3
	rol r4 r4

	# try to subtract
	sub r4 r4 r2
	jn div_fail

	# if it works set the least significant bit of the quotient to 1
	ld r5 1
	or r3 r3 r5
	j check_done
div_fail:
	# set the bit to 0
	ld r5 2
	ld r7 0
	sub r7 r7 r5
	and r3 r3 r7
	# then undo subtraction
	add r4 r4 r2
check_done:
	ld r5 1
	sub r6 r6 r5
	jz div_done
	j div_loop
div_done:
	# after loop, clean up variables
	add r30 r30 r28
	read r30 r1
	add r30 r30 r28
	read r30 r2
	add r30 r30 r28
	read r30 r5
	add r30 r30 r28
	read r30 r6
	add r30 r30 r28
	read r30 r7
	ret r26

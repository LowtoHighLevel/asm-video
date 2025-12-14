
# Prints a character to the screen
#
# r2 - Character
print_char:
	# save our used register
	write r30 r1
	sub r30 r30 r28

	# Load print address and write output
	ld r1 16384
	write r1 r2

	# reload our used register
	add r30 r30 r28
	read r30 r1
	
	# return
	ret r26

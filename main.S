# CPU initialization, set up stack
init:
	ld r30 14332
	j main


.include ./io.S

# Main function
main:
	ld r1 15
	# prints hi
	ld r2 'H'
	call print_char
	ld r2 'I'
	call print_char
	ld r2 '!'
	call print_char
	ld r2 '\n'
	call print_char
	# HACK, tells our emulator to quit.
	ld r30 36000

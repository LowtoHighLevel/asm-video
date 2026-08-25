# CPU initialization, set up stack
init:
	ld r30 14332
	j main

.include ./io.S
.include ./math.S

# tests the shifting bits
shift_test:
	# store used registers
	write r30 r1
	sub r30 r30 r28
	write r30 r2
	sub r30 r30 r28
	write r30 r3
	sub r30 r30 r28

	# Test printing
	ld r1 1
	ld r3 '1'
	add r2 r1 r3
	call print_char

	# Test shift left
	call shl
	add r2 r1 r3
	call print_char

	# test shift right
	call shr
	add r2 r1 r3
	call print_char

	# print newline
	ld r2 '\n'
	call print_char

	# reload used registers
	add r30 r30 r28
	read r30 r3
	add r30 r30 r28
	read r30 r2
	add r30 r30 r28
	read r30 r1

	ret r26

# prints hi	
print_hi:
	ld r2 'H'
	call print_char
	ld r2 'I'
	call print_char
	ld r2 '!'
	call print_char
	ld r2 '\n'
	call print_char
	ret r26

mult_test:
	ld r1 2
	ld r2 4
	call multiply
	# r3 should be 8
	ld r2 '0'
	add r2 r2 r3
	call print_char
	ld r2 '\n'
	call print_char
	ret r26

div_test:
	ld r1 9
	ld r2 4
	call divide
	# r3 should be 8
	ld r2 '0'
	add r2 r2 r3
	call print_char
	ld r2 '\n'
	call print_char
	ld r2 '0'
	add r2 r2 r4
	call print_char
	ld r2 '\n'
	call print_char
	ret r26
	
# Main function
main:
	call shift_test
	call mult_test
	call div_test
	# Hi output test
	ld r1 15
	call print_hi
	# HACK, tells our emulator to quit.
	ld r30 36000

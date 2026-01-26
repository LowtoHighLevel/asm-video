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

	

.globl main

.text
main:
	# ==== Read the element count ====
	li	a7, 5
	ecall
	mv	s0, a0			# s0 = the number of numbers


	# ==== Allocate the required space using sbrk ====
	slli	a0, s0, 3
	li	a7, 9
	ecall
	mv	s1, a0			# s1 = the address of allocated space

	# ==== Read the number for each element ====
	# for (s2 = 0; s2 < s0; s2++)
	li	s2, 0
Loop0:	bge	s2, s0, Exit0

	# Read the number from console and store it into memory
	li	a7, 5
	ecall
	slli	t0, s2, 3
	add	t0, t0, s1
	sd	a0, 0(t0)

	addi	s2, s2, 1
	j	Loop0
Exit0:


	# ==== Call the sorting algorithm ====
	# sort(addr, count)
	mv	a0, s1
	mv	a1, s0
	jal	sort


	# ==== Print the result ====
	# for (s2 = 0; s2 < s0; s2++)
	li	s2, 0
Loop1:	bge	s2, s0, Exit1

	# Load and print the number
	slli	t0, s2, 3
	add	t0, t0, s1
	ld	a0, 0(t0)
	li	a7, 1
	ecall

	# Print '\n'
	li	a7, 11
	li	a0, 10			# The ASCII code for '\n' is 10.
	ecall

	addi	s2, s2, 1
	j	Loop1
Exit1:


	# ==== Exit the program with return code 0 ====
	li a0, 0
	li a7, 93
	ecall

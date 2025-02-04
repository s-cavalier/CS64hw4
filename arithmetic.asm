# arithmetic.asm program
# CS 64, Z.Matni
#
# 1. Prompt the user for 3 inputs: a, b, c
# 2. Calculate 64*( 4*b – a) + 5*c using only one mult instruction
# 3. Print out the result

.text
main:
	li $v0, 5
	syscall
	move $t0, $v0 # a
	li $v0, 5
	syscall
	move $t1, $v0 # b
	li $v0, 5
	syscall
	move $t2, $v0 # c
	sll $t1, $t1, 2 # 4 * b
	sub $t1, $t1, $t0 # b - a
	sll $t1, $t1, 6 # 64 * (4b - a)
	li $t3, 5
	mult $t2, $t3 # c * 5
	mflo $t2 # load into t2
	add $a0, $t1, $t2
	li $v0, 1
	syscall
exit:
	li $v0, 10
	syscall

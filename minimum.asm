# minimum.asm program
# CS 64, Z.Matni
#
# Get 3 integer inputs from the user (std.in)
# Reveal the minimum value
# See assignment description for details

#Data Area (i.e. memory setup directive)
.data
	# TODO: Complete these incomplete declarations / initializations

	prompt: .asciiz "Enter the next number:\n"
	end: .asciiz "Minimum: "
	newline: .asciiz "\n"

#Text Area (i.e. instructions/code directive)
.text

main:
	la $a0, prompt
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	la $a0, prompt
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $t1, $v0
	la $a0, prompt
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $t2, $v0

	slt $t3, $t0, $t1 # a < b ?
	beq $t3, $zero, false
	move $t4, $t0
	j cont 
false:
	move $t4, $t1	

cont:
	slt $t3, $t4, $t2 # min(a,b) < c ?
	bne $t3, $zero, exit
	move $t4, $t2
exit:
	la $a0, end
	li $v0, 4
	syscall
	li $v0, 1
	move $a0, $t4
	syscall
	la $a0, newline
	li $v0, 4
	syscall
	li $v0, 10
	syscall

# factorial.asm program
# CS 64, Z.Matni
#
# Assembly (NON-RECURSIVE) version of:
#   unsigned int n, fn=1;
#   cout << "Enter a number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++)
#       fn = fn * x;
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";

#Data Area (i.e. memory setup directive)
.data
	string1: .asciiz "Enter a number:\n"
	string2: .asciiz "Factorial of "
	string3: .asciiz " is:\n"
	string4: .asciiz "\n"

#Text Area (i.e. instructions/code directive)
.text
main:
	li $v0, 4
	la $a0, string1
	syscall # enter a number

	li $v0, 5
	syscall # std.in

	move $t0, $v0 # t0 = n
	li $t1, 1 # fn = 1
	li $t2, 2 # x = 2, iterator
loop:
	slt $t3, $t0, $t2 # t3 = x > n, want exit if false
	bne $t3, $zero, exit # x > n == 0 -> x <= n == 1
	mult $t1, $t2
	mflo $t1
	addi $t2, 1
	j loop
exit:
	li $v0, 4
	la $a0, string2
	syscall

	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 4
	la $a0, string3
	syscall

	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, string4
	syscall

	li $v0, 10
	syscall

#Vincent Mustillo
#Lab 3a
#Program to compare two numbers

#specify to be loaded into data section of memory
.data
    description: .asciiz "This program compares two numbers.\n" #null-terminated string
    first: .asciiz "Enter first integer: " #null-terminated string
    second: .asciiz "Enter second integer: " #null-terminated string
    less: .asciiz "The 1st number is smaller than the second number" #null-terminated string
    notEqual: .asciiz "The two numbers are not equal" #null-terminated string
    equal: .asciiz "The two numbers are equal" #null-terminated string
    greater: .asciiz "The 1st number is greater than the second number" #null-terminated string

#specify program instructions in text section of memory
.text
.globl main
main: 	
	#refer to Appendix B-44 for syscall code

    li $v0, 4	#syscall for prt string
    la, $a0, description    #address of description
    syscall

    li $v0, 4	#syscall for prt string
	la $a0, first	#address of first string
	syscall

	li $v0, 5	#syscall for read int
    syscall

    move $t1, $v0   #move first int to temporary register

    #reading second integer
    li $v0, 4	#syscall for prt str
	la $a0, second	#address of second string
	syscall

	li $v0, 5	#syscall for read int
	syscall
    move $t2, $v0

    slt $t3, $t1, $t2      # checks if $t1 > $t2
    beq $t3, 1, printLess     # if $t1 > $t2, calls printLess
    beq $t1, $t2, printEqual   # if $t1 = $t2, calls printEqual 
    beq $t3, $zero, printGreater # if $t1 < $t2, calls printGreater
    
    li $v0, 10	#syscall code to exit
	syscall

    printLess:
        li $v0, 4
        la $a0, less
        syscall

        li $v0, 10	#syscall code to exit
	    syscall

    printEqual:
        li $v0, 4
        la $a0, equal
        syscall

        li $v0, 10	#syscall code to exit
	    syscall

    printGreater:
        li $v0, 4
        la $a0, greater
        syscall

        li $v0, 10	#syscall code to exit
	    syscall
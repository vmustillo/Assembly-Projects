#Vincent Mustillo
#Lab 6
#Program to 

#specify to be loaded into data section of memory
.data
    description: .asciiz "This program implements blt using slt and bne instructions.\n" #null-terminated string
    first: .asciiz "Enter first integer: " #null-terminated string
    second: .asciiz "Enter second integer: " #null-terminated string
    greater: .asciiz "The fist number is not less than the second number." #null-terminated string
    less: .asciiz "The fist number is less than the second number." #null-terminated string


#specify program instructions in text section of memory
.text
.globl main
    main: 	
        li $v0, 4	#syscall for prt string
        la, $a0, description    #address of description
        syscall

        li $v0, 4	#syscall for prt string
	    la $a0, first	#address of first string
	    syscall

	    li $v0, 5	#syscall for read int
        syscall

        move $t1, $v0   #move first int to temporary register

        li $v0, 4	#syscall for prt string
	    la $a0, second	#address of first string
	    syscall

	    li $v0, 5	#syscall for read int
        syscall

        move $t2, $v0   #move first int to temporary register

        la $t0, ($t1) # t0 is a constant 1
        li $t2, 0 # t2 is our counter (i)
        la $t3 ($t1) #copy input integer to $t3

        slt $t3, $t1, $t2      # checks if $t1 > $t2
        beq $t3, 1, printLess     # if $t1 > $t2, calls printLess
        beq $t1, $t2, printless   # if $t1 = $t2, calls printEqual 
        beq $t3, $zero, printGreater # if $t1 < $t2, calls printGreater
    
        li $v0, 10	#syscall code to exit
	    syscall

    printLess:
        li $v0, 4
        la $a0, less
        syscall

        li $v0, 10	#syscall code to exit
	    syscall

    printGreater:
        li $v0, 4
        la $a0, greater
        syscall

        li $v0, 10	#syscall code to exit
	    syscall
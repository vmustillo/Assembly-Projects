#Vincent Mustillo
#Lab 5b
#Program to 

#specify to be loaded into data section of memory
.data
    description: .asciiz "This program will take an integer and add all the sqaures leading up to it.\n" #null-terminated string
    first: .asciiz "Enter first integer: " #null-terminated string
    final: .asciiz "The result is: " #null-terminated string
    cancel: .asciiz "Goodbye" #null-terminated string

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

        blez $t1, cancel

        la $t0, ($t1) # t0 is a constant 1
        li $t2, 0 # t2 is our counter (i)
        la $t3, 0 #copy input integer to $t3
        
        loop:
            beq $t2, $t0, end # if t2 == n we are done

            addi $t2, $t2, 1 # add 1 to t1
            mult $t1, $t1
            mflo $t5
            add $t3, $t3, $t5
            addi $t1, $t1, -1  # subtract 1 from t1
            j loop # jump back to the top
        
        end:

            li $v0, 4
            la $a0, final
            syscall

            move $a0, $t3   #move to a0 for the integer output
            li $v0, 1  #syscall for printing integer
            syscall

            li $v0, 10
            syscall

        cancel:

            li $v0, 4
            la $a0, goodbye
            syscall

            li, $v0, 10
            syscall
#Vincent Mustillo
#Lab 4
#Program to read in three integers and print out their average

#specify to be loaded into data section of memory
.data
description: .asciiz "This program averages three numbers.\n" #null-terminated string
first: .asciiz "Enter first integer: " #null-terminated string
second: .asciiz "Enter second integer: " #null-terminated string
third: .asciiz "Enter third integer: " #null-terminated string
final: .asciiz "The result is: " #null-terminated string
remainder: .asciiz "\nRemainder: " #null-terminated string

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

    #reading third integer
    li $v0, 4	#syscall for prt str
	la $a0, third	#address of second string
	syscall

	li $v0, 5	#syscall for read int
	syscall
    move $t3, $v0

    add $t4, $t1, $t2	#adding two integers and storing in $t4
    add $t5, $t4, $t3
    addi $t6, $t6, 3
    
    li $v0, 4	#syscall for prt str
	la $a0, final	#address of second string
	syscall

    #dividing the total by 3
    div $t5, $t6
    mflo $a0
    li $v0, 1  #syscall for printing integer
    syscall

    li $v0, 4
    la $a0, remainder
    syscall
            
    mfhi $a0
    li $v0, 1
    syscall
    
    li $v0, 10	#syscall code to exit
	syscall
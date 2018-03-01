#Vincent Mustillo
#Lab 4a
#Program to print the area of a rectangle

#specify to be loaded into data section of memory
.data
description: .asciiz "This program calculates the area of a rectangle.\n" #null-terminated string
first: .asciiz "Enter the length of the rectangle: " #null-terminated string
second: .asciiz "Enter the width of the rectangle: " #null-terminated string
final: .asciiz "The area of the rectangle is: " #null-terminated string

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

    mult $t2, $t1
    mfhi $t3
    mflo $t4

    li $v0, 4
    la $a0, final
    syscall

    move $a0, $t4   #move to a0 for the integer output
    li $v0, 1  #syscall for printing integer
    syscall
    
    li $v0, 10	#syscall code to exit
	syscall
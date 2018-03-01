#Vincent Mustillo
#Lab 1
#Program to print HELLO WORLD

#specify to be loaded into data section of memory
.data
str: .asciiz "HELLO WORLD" #null-terminated string

#specify program instructions in text section of memory
.text
.globl main
main: 	
	#refer to Appendix B-44 for syscall code
	li $v0, 4	#syscall for prt str
	la $a0, str	#address of str
	syscall

	li $v0, 10	#syscall code to exit
	syscall

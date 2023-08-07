.globl factorial

.data
n: .word 7

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    # YOUR CODE HERE
    mv t1, a0	
    mv t2, t1
    
loop:
    addi t2, t2, -1
    beq t2, x0, exit
    mul t1, t1, t2
	j loop

exit:
	mv a0, x0 		
    add a0, x0, t1 	
	ret
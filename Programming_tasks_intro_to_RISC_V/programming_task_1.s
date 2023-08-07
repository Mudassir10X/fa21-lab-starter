.data


b:  .word 0
    .word 0
    .word 0

.text
main:
    add s0, x0, x0
    addi t4, x0, 3
    addi s1, x0, 7
    la s2, b
    # add t1, x0, s2
snippet:
    bge s0, t4, done
    mul t0, s0, s1
    add t0, t0, s1
    sw t0, 0(s2)
    addi s2, s2, 4
    addi s0, s0, 1
    j snippet
done:
    addi a0, x0, 10
    ecall
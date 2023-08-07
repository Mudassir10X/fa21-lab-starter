.data
array:  .space 40
.text
.globl subt
subt:
    sub     a3, a0, a1
    ret

.globl compare
compare:
    addi    sp, sp, -4
    sw      ra, 0(sp)
    
    jal     subt
    bgez    a3, greater_equal
    li      a4, 0
    j       compare_done
    
greater_equal:
    li      a4, 1
    
compare_done:
    lw      ra, 0(sp)
    addi    sp, sp, 4
    ret

.globl dataArray
dataArray:
    addi    sp, sp, -16
    sw      ra, 0(sp)
    sw      a0, 4(sp)
    
    li      s0, 0          # i = 0
    la      s1, array
    
dataArray_loop:
    li      t4, 10
    bge     s0, t4, dataArray_done
    
    mv      a1, s0          # b = i
    jal     compare         # call compare(a, b)
    sw      a4, 0(s1)   # store result in array[i]
    addi    s1, s1, 4
    addi    s0, s0, 1       # i = i + 1
    j       dataArray_loop
    
dataArray_done:
    lw      ra, 0(sp)
    lw      s0, 4(sp)
    addi    sp, sp, 16
    ret

.globl main
main:
    addi    sp, sp, -4
    sw      ra, 0(sp)
    
    li      a0, 5          # argument for dataArray
    jal     dataArray       # call dataArray(5)
    
    lw      ra, 0(sp)
    addi    sp, sp, 4
    ret

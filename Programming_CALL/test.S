.globl _start
.text   
_start:           
    la a0, num
    lw a0, 0(a0)        # Passing num as argument to factorial function
    
    jal factorial
    
    add t0, a0, x0
    
    la s0, result
    sw a0, 0(s0)
    
    j write_tohost
    
    
    
    factorial:
        addi sp, sp, -8
        
        sw ra, 0(sp)        # Storing Return address in stack
        sw s0, 4(sp)        # Storing s0 in stack        
        
        mv s0, a0
        addi t0, x0, 1
        
        ble s0, t0, return_one
        
        addi a0, a0, -1     # Num-1 as argument
        jal factorial       # Recurse       
          
        mul a0, a0, s0
        
        lw ra, 0(sp)
        lw s0, 4(sp)
        addi sp, sp, 8      
        
        ret
        
        return_one:
            addi a0, x0, 1
            lw ra, 0(sp)    # Load ra from stack
            lw s0, 4(sp)    # Load s0 from stack
            addi sp, sp, 8
            ret

write_tohost:

li x1, 1

sw x1, tohost, t5

j write_tohost

.data 

    num:    .word 10
    result:  .word 0

.align 12

.section ".tohost","aw",@progbits;                            

.align 4; .global tohost; tohost: .dword 0;                     

.align 4; .global fromhost; fromhost: .dword 0;
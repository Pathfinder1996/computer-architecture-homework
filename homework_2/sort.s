.globl sort

# === partition(addr, lo, hi) ===
partition:
    # Save ra and s-registers, allocate stack space
    addi    sp, sp, -40     
    sd      ra, 0(sp)      
    sd      s0, 8(sp)       
    sd      s1, 16(sp)       
    sd      s2, 24(sp)
    sd      s3, 32(sp)        

    # Backup a0-a2 to callee-saved registers
    mv      s0, a0           # s0 = base address
    mv      s1, a1           # s1 = lo
    mv      s2, a2           # s2 = hi

    # pivot = array[lo]
    slli    t0, s1, 3        # t0 = lo * 8
    add     t0, s0, t0       # t0 = addr + lo * 8
    ld      t1, 0(t0)        # t1 = pivot = array[lo]

    # Initialize i and j
    addi    t2, s1, -1       # t2 = i = lo - 1
    addi    t3, s2, 1        # t3 = j = hi + 1

loop_forever:
    # i++
do_i_add_one:
    addi    t2, t2, 1
    bgt     t2, s2, partition_exit   # Prevent i > hi (out-of-bound)
    slli    t4, t2, 3
    add     t4, s0, t4
    ld      t5, 0(t4)        # t5 = array[i]
    blt     t5, t1, do_i_add_one

    # j--
do_j_sub_one:
    addi    t3, t3, -1
    blt     t3, s1, partition_exit   # Prevent j < lo (out-of-bound)
    slli    t6, t3, 3
    add     t6, s0, t6
    ld      t5, 0(t6)        # t5 = array[j]
    bgt     t5, t1, do_j_sub_one

    # if i >= j, return j
    bge     t2, t3, partition_exit

    # swap array[i] and array[j]
    mv      a0, t4
    mv      a1, t6
    jal     swap

    j       loop_forever

partition_exit:
    mv      a0, t3           # return j
    # Restore registers and return
    ld      ra, 0(sp)      
    ld      s0, 8(sp)       
    ld      s1, 16(sp)      
    ld      s2, 24(sp)
    ld      s3, 32(sp)    
    addi    sp, sp, 40  
    ret

# === swap(a, b): exchange values at a and b ===
swap:
    addi    sp, sp, -16
    sd      ra, 0(sp)

    ld      t0, 0(a0)
    ld      t1, 0(a1)
    sd      t1, 0(a0)
    sd      t0, 0(a1)

    ld      ra, 0(sp)
    addi    sp, sp, 16
    ret

# === quicksort(addr, lo, hi) ===
quicksort:
    addi    sp, sp, -32
    sd      ra, 0(sp)        
    sd      s0, 8(sp)       
    sd      s1, 16(sp)       
    sd      s2, 24(sp)       

    mv      s0, a0           # addr
    mv      s1, a1           # lo
    mv      s2, a2           # hi

    # if (lo < 0 || hi < 0 || lo >= hi) return
    blt     s1, zero, quicksort_exit
    blt     s2, zero, quicksort_exit
    bge     s1, s2, quicksort_exit

    # j = partition(addr, lo, hi)
    mv      a0, s0
    mv      a1, s1
    mv      a2, s2
    jal     partition
    mv      t0, a0           # j

    # quicksort(addr, lo, j)
    mv      a0, s0
    mv      a1, s1
    mv      a2, t0
    jal     quicksort

    # quicksort(addr, j+1, hi)
    mv      a0, s0
    addi    a1, t0, 1
    mv      a2, s2
    jal     quicksort

quicksort_exit:
    ld      ra, 0(sp) 
    ld      s0, 8(sp)   
    ld      s1, 16(sp) 
    ld      s2, 24(sp)  
    addi    sp, sp, 32
    ret

# === sort(addr, count): wrapper ===
sort:
    addi    sp, sp, -16
    sd      ra, 0(sp)        
    sd      s0, 8(sp)

    mv      s0, a0            # addr
    mv      t0, a1            # count
    addi    t0, t0, -1        # hi = count - 1

    mv      a0, s0
    mv      a1, zero          # lo = 0
    mv      a2, t0            # hi
    jal     quicksort        

    ld      ra, 0(sp)        
    ld      s0, 8(sp)
    addi    sp, sp, 16
    ret

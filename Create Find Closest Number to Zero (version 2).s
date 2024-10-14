.data
nums:
    .word -4,-2,1,4,8
    .word 0,-2,2
    .word 99,-99,100,-100,101,-10
numsSize:
    .word 5
    .word 3
    .word 6
str: .string "\n"
.text
main:
    li s1, 3         #number of test case
    la s2, numsSize  #load address of numsSize
    la s3, nums      #load address of nums
test:
    jal ra, findNonMinOrMax #goto findNonMinOrMax function
    jal ra, printResult     #goto printResult function           
    addi s2, s2, 4          #next numsSize
    addi s1, s1, -1         
    bne s1, zero, test
    # Exit the program
    li a7, 10      # System call code for exiting the program
    ecall          # Make the exit system call

findNonMinOrMax:
    lw t0, 0(s2)  #int i
    lw t1, 0(s3)  #closest_num = nums[0]
loop:
    lw t2, 0(s3)  #nums[i]
    
    #set abs(closest_num)
    add t3, zero, t1 
    bgez t3, next_1
    neg t3,t3
next_1:
    #set abs(nums[i])
    add t4, zero, t2
    bgez t4, next_2
    neg t4,t4
next_2: 
    #if(abs(nums[i])<abs(closest_num)) then closest_num=nums[i]
    bge t4, t3, next_3 
    add t1, zero, t2
    j loop_decrement
    #if(abs(nums[i])==abs(closest_num)) then continue
next_3: bne t4, t3, loop_decrement
        #if(nums[i]>closest_num) then closest_num=nums[i]
        ble t2, t1, loop_decrement 
        add t1, zero, t2
loop_decrement:
    addi s3, s3, 4
    addi t0, t0, -1 
    bne t0,zero, loop
    ret
printResult:
    mv a0, t1 #set the system call use data
    li a7, 1  #set the system call number
    ecall
    
    la a0, str #set the system call use data
    li a7, 4  #set the system call number
    ecall
    ret

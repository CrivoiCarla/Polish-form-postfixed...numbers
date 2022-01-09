.data

    str: .space 301
    chDelim: .asciz " "
    formatPrintf: .asciz "%d\n"
    rez: .space 4
    x: .space 4
    y: .space 4
    
.text

.global main


main:


    pushl $str 
    call gets
    popl %ebx



    pushl $chDelim
    pushl $str
    call strtok 
    popl %ebx
    popl %ebx

    movl %eax, rez 
    push rez
    call atoi
    popl %ebx

    pushl %eax
    jmp et_for

et_for:

    pushl $chDelim
    pushl $0
    call strtok
    popl %ebx
    popl %ebx 


    cmp $0, %eax
    je et_afisare

    movl %eax, rez

    pushl rez
    call atoi
    popl %ebx

    cmp $0, %eax
    je et_operatie

    #movl %eax, rez
    pushl %eax

    jmp et_for
    
et_operatie:

    xorl %ecx, %ecx

    movl rez, %edi
    movb (%edi, %ecx, 1), %al 

    cmp $97, %al 
    je et_add

    cmp $115, %al 
    je et_sub

    cmp $109, %al 
    je et_mul

    cmp $100, %al 
    je et_div
    
et_add:

    popl y
    popl x
    movl y, %eax
    addl x, %eax
    movl %eax, x
    pushl x
    jmp et_for
    
et_sub:

    popl y
    popl x
    movl x, %eax
    subl y, %eax
    movl %eax, x
    pushl x
    jmp et_for
    
et_mul:

    popl y
    popl x
    movl y, %eax
    mull x
    movl %eax, x
    pushl x
    jmp et_for
    
et_div:

    xor %edx,%edx
    popl y
    popl x
    movl x, %eax
    divl y
    movl %eax, x
    pushl x
    jmp et_for

et_afisare:

    pushl $formatPrintf
    call printf
    popl %ebx
    popl %ebx

    jmp et_exit


et_exit:

    movl $1,%eax
    xorl %ebx,%ebx
    int $0x80

    movl $1,%eax
    xorl %ebx,%ebx
    int $0x80

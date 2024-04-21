/*
* Multiboot Header
*/

//constants
.set ALIGN,	1<<0
.set MEMINFO,	1<<1
.set FLAGS,	ALIGN | MEMINFO
.set MAGIC,	0x1BADB002
.set CHECKSUM,	-(MAGIC + FLAGS)

//header definition
//searched for in first 8KiB of the kernel file
.section .multiboot
.align	4
.long MAGIC
.long FLAGS
.long CHECKSUM

//stack definition
.section .bss
.align 16
stack_bottom:
.skip 16384
stack_top:

//call kernel
.section .text
.global _start
.type _start, @function
_start:
	mov $stack_top, %esp	//mov top of the stack to the stack pointer
	
	//init processor state/features here - not today

	call kernel_main	//enter high level kernel
	
	cli	//disable interrupts
1:	hlt	//wait with halt until an interrupt occurs - which is not possible because of above 
	jmp 1b

.size _start, . - _start


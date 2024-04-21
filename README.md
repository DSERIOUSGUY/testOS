# testOS
Barebones kernel implementation, based on tutorial from: https://wiki.osdev.org

## Compiling the OS 
This is a Barebones OS and follows the i686 tutorial(https://wiki.osdev.org/Bare_Bones). 
As a result, it is assumed that you have set up the cross compiler toolchain accordingly.

Before compilation, make sure the location for the toolchain in the Makefile is set 
appropriately. Then run 

```
make 
```

## Booting the kernel 
Use either of the following commands to boot the kernel in a VM

``` qemu-system-i386 -cdrom myos.iso ```or ``` qemu-system-i386 -kernel myos.bin ```

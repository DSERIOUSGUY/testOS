TOOLCHAIN:=/home/${USER}/opt/cross/bin/i686-elf

bundle_os:
	make compile-asm
	make compile-kernel
	make link-kernel
	make create-image

compile-asm:
	${TOOLCHAIN}-as boot.s -o boot.o
compile-kernel:
	${TOOLCHAIN}-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
link-kernel:
	${TOOLCHAIN}-gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc
create-image:
	mkdir -p isodir/boot/grub
	cp myos.bin isodir/boot/myos.bin
	cp grub.cfg isodir/boot/grub/grub.cfg
	grub-mkrescue -o myos.iso isodir

clean:
	rm -rf isodir *.o *.bin *.iso *.out

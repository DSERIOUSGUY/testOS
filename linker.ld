/* designate entry point */
ENTRY(_start)

SECTIONS
{
	/* offset for safe load */
	. = 2M;

	.text BLOCK(4K) : ALIGN(4K)
	{
		*(.multiboot) /* MAGIC HEADER FOR MULTIBOOT */
		*(.text)
	}

	/* read-only */
	.rodata BLOCK(4K) : ALIGN(4K)
	{
		*(rodata)
	}

	/* read/write */
	.data BLOCK(4K) : ALIGN(4K)
	{
		*(.data)
	}

	/* un-init r/w data + stack */
	.bss BLOCK(4K) : ALIGN(4K)
	{
		*(COMMON)
		*(.bss)
	}
}


/*Entry point of application to be run*/
ENTRY(Reset_Handler)

/*Define Memory Sections Size*/
MEMORY
{
	FLASH(rx) : ORIGIN = 0x08000000 ,LENGTH = 256K
	SRAM(rwx) : ORIGIN = 0x20000000 ,LENGTH = 20K
}

/*Define Sections and its Size*/
SECTIONS
{
	.text : 
	{
		*(.isr_vector)
		*(.text)
		*(.rodata)
		e_text = . ;
	}>FLASH 			/*>VMA AT >LMA*/
	
	.data :
	{
		s_data = . ;
		*(.data)
		. = ALIGN(8);
		e_data = . ;
	}>SRAM AT >FLASH
	
	.bss :
	{
		s_bss = . ;
		*(.bss)
		e_bss = . ;
	}>SRAM
}


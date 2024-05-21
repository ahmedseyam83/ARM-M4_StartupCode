## First Command
AC=arm-none-eabi-gcc
LN=-T stm32f401cc_linkerscript.ld -nostdlib -Wl,-Map=file.map


## First rule to generate main.o
main.o:main.c
	$(AC) -c $^ -o $@
	
mrcc.o:MRCC_Program.c
	$(AC) -c $^ -o $@
	
mgpio.o:MGPIO_Program.c
	$(AC) -c $^ -o $@
	

stm32f401_startupfile.o:stm32f401_startupfile.c
	$(AC) -c $^ -o $@
	
file.elf:
	$(AC) *.o $(LN) -o $@
	

all:main.o mrcc.o mgpio.o stm32f401_startupfile.o file.elf

clean:
	rm -f-r *.o file.elf 
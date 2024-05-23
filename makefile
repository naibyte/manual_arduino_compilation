myprogram = hello_world.cpp
output_filename = hello.elf

all:
	clear
	cp arduino/main.cpp .
	head main.cpp -n 21 > combined_main.cpp
	echo 'extern "C" void __cxa_pure_virtual() { while(1);};' >> combined_main.cpp
	cat $(myprogram) >> combined_main.cpp
	tail main.cpp -n 30 >> combined_main.cpp
	avr-gcc -Os -mmcu=atmega2560 -DF_CPU=16000000UL -c -o hws.o arduino/HardwareSerial.cpp -Iarduino
	avr-gcc -Os -mmcu=atmega2560 -DF_CPU=16000000UL -c -o hws0.o arduino/HardwareSerial0.cpp -Iarduino
	avr-gcc -Os -mmcu=atmega2560 -DF_CPU=16000000UL -c -o print.o arduino/Print.cpp -Iarduino
	avr-gcc -Os -mmcu=atmega2560 -DF_CPU=16000000UL -c -o usb.o arduino/USBCore.cpp -Iarduino
	avr-gcc -Os -mmcu=atmega2560 -DF_CPU=16000000UL -c -o wiring.o arduino/wiring.c -Iarduino
	avr-gcc -Os -mmcu=atmega2560 -DF_CPU=16000000UL -c -o hooks.o arduino/hooks.c -Iarduino
	avr-gcc -Os -mmcu=atmega2560 -DF_CPU=16000000UL -c -o main.o combined_main.cpp -Iarduino

	avr-gcc -Os -mmcu=atmega2560 -DF_CPU=16000000UL -o $(output_filename) hws.o hws0.o usb.o print.o wiring.o hooks.o main.o

clean:
	rm hws.o hws0.o print.o usb.o wiring.o hooks.o main.o combined_main.cpp

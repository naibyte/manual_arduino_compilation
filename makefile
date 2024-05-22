all:
	clear
	avr-gcc -Os -mmcu=atmega2560 -DF_CPU=16000000UL -c -o hello.o hello_world.cpp -Iarduino
	avr-gcc -Os -mmcu=atmega2560 -DF_CPU=16000000UL -c -o hws.o arduino/HardwareSerial.cpp -Iarduino
	avr-gcc -Os -mmcu=atmega2560 -DF_CPU=16000000UL -c -o hws0.o arduino/HardwareSerial0.cpp -Iarduino
	avr-gcc -Os -mmcu=atmega2560 -DF_CPU=16000000UL -c -o print.o arduino/Print.cpp -Iarduino
	avr-gcc -Os -mmcu=atmega2560 -DF_CPU=16000000UL -c -o usb.o arduino/USBCore.cpp -Iarduino
	avr-gcc -Os -mmcu=atmega2560 -DF_CPU=16000000UL -c -o wiring.o arduino/wiring.c -Iarduino
	avr-gcc -Os -mmcu=atmega2560 -DF_CPU=16000000UL -c -o hooks.o arduino/hooks.c -Iarduino

	avr-gcc -Os -mmcu=atmega2560 -DF_CPU=16000000UL -o hello.elf wiring.o hooks.o hws.o hws0.o usb.o print.o hello.o


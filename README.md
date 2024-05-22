# Compiling Arduino Sketches Without Magic  
The Arduino IDE handles a lot of complexity for you when you click build and upload. I was curious how the underlying build system worked so here we are.  
*AVR-GCC* is used to compile code for the Arduino. It can target various chipsets, for example, the Arduino UNO, which uses the ATmega328P (see last link at bottom). In this example I target the ATmega2560.  

The basic steps are:  
1. Compile-only all of the code that you write, and will need to link with from the Arduino Core. This will create object files for each thing you compile.  
2. Link all of the object files together.  
3. Create an ELF binary. This is ready to use in Qemu.  
  
To upload the resultant binary to an actual Arduino, use AVRDUDE.  
4. Extract the machine code from the ELF, which isn't usable by the Arduino by itself. ```avr-objcopy -O ihex -R .eeprom hello.elf hello.ihex```  
5. Upload the extracted hex to the Arduino. ```avrdude -C /path/to/avrdude.conf -p m328p -c usbasp -b 19600 -P PORT_NAME -U flash:w:hello.ihex:i```  
See [this useful stack overflow response (listed below) for a good write up on all of this plus AVRDUDE's options.](https://stackoverflow.com/questions/32413959/avr-gcc-with-arduino)

Requirements:
```bash
sudo apt install avr-libc
sudo apt install avr-gcc
sudo apt install make
sudo apt install build-essential
```

Requires Arduino Core: https://github.com/arduino/ArduinoCore-avr  
Arduino classes are often reliant on other header files. You must compile and link with each one.

## Running with Qemu
```qemu-system-avr -machine mega2560 -bios hello.elf -serial stdio```

#### Helpful Websites
https://stackoverflow.com/questions/32413959/avr-gcc-with-arduino  
https://www.qemu.org/docs/master/system/target-avr.html#avr-system-emulator  
https://gcc.gnu.org/onlinedocs/gcc-14.1.0/gcc/AVR-Options.html  
https://docs.arduino.cc/learn/programming/memory-guide/#arduino-boards-architectures

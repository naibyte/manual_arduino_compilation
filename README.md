# manual_arduino_compilation
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
qemu-system-avr -machine mega2560 -bios hello.elf -serial stdio  

#### Helpful Websites
https://stackoverflow.com/questions/32413959/avr-gcc-with-arduino  
https://www.qemu.org/docs/master/system/target-avr.html#avr-system-emulator  
https://gcc.gnu.org/onlinedocs/gcc-14.1.0/gcc/AVR-Options.html

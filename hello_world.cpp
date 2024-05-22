#include <HardwareSerial.h>
extern "C" void __cxa_pure_virtual() { while(1);};

void setup() {
};

void loop() {
	Serial.println("Hello World");
	loop();
};

int main() {
	Serial.begin(115200);
	loop();
	return 0;
};

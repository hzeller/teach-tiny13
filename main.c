
#define F_CPU 1000000

#define LED_PIN (1<<3)

#include <avr/io.h>
#include <util/delay.h>

int main() {
	DDRB = LED_PIN;           // Data direction register: LED_PIN is output
	while (true) {
		PORTB = LED_PIN;  // Switch LED on
		_delay_ms(100);   // Wait time on
		PORTB = 0;        // Switch LED off
		_delay_ms(1000);  // Wait time off. Note that this is longer.
	}
}

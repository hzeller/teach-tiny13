
#define F_CPU 1000000

#include <avr/io.h>
#include <util/delay.h>

int main() {
	DDRB = (1<<3);
	for (;;) {
		PORTB = (1<<3);
		_delay_ms(100);
		PORTB = 0;
		_delay_ms(100);
	}
}

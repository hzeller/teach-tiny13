
TARGET_ARCH=-mmcu=attiny13

CC=avr-gcc
CFLAGS=-Os -g -Wall

AVRDUDE_DEVICE ?= /dev/ttyUSB0
AVRDUDE     = avrdude -p t13 -c stk500v2 -P $(AVRDUDE_DEVICE)
FLASH_CMD   = $(AVRDUDE) -e -U flash:w:main.hex
LINK=avr-gcc -g $(TARGET_ARCH) -Wl,-gc-sections
OBJECTS=main.o

all : main.hex

main.elf: $(OBJECTS)
	$(LINK) -o $@ $(OBJECTS)
	avr-size $@

main.hex: main.elf
	avr-objcopy -j .text -j .data -O ihex main.elf main.hex

flash: main.hex
	$(FLASH_CMD)

eeprom-flash: eeprom.hex
	$(AVRDUDE) -U eeprom:w:eeprom.hex

clean:
	rm -f $(OBJECTS) main.elf main.hex

# todo: add make fuse

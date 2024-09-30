CC = gcc
CFLAGS = -c -Wall -Wextra -pedantic -O0 -g3 -fsanitize=address -fno-omit-frame-pointer -fno-optimize-sibling-calls
LDFLAGS = -Wall -Wextra -pedantic -O0 -g3 -fsanitize=address -fno-omit-frame-pointer -fno-optimize-sibling-calls

ALL_OBJECTS = src/main.o
ALL_EXECUTABLES = main
ALL_TEST_EXECUTABLES = tests/test1

OBJECTS_DIR = objects/
BUILD_DIR = build/

main: $(ALL_OBJECTS), $(ALL_EXECUTABLES), $(ALL_TEST_EXECUTABLES)

dirs:
	mkdir -p build
	mkdir -p objects

find_device: src/find_device.c include/find_device.h
	$(CC) src/find_device.c -lpcap -I include -o $(BUILD_DIR)/find_device.o

clean:
	rm -rf objects/

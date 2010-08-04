CC       = gcc
LD       = $(CC)
CPPFLAGS = -D$(ARCH)=1
CFLAGS   = -Wall -O0 -g
LDFLAGS  =

ARCH     = $(shell uname -m)

OBJECTS = main.o child.o syscall.o path.o

proot: $(OBJECTS)
	$(LD) $(LDFLAGS) $(OBJECTS) -o $@

%.o: %.c *.h
	$(CC) $(CPPFLAGS) $(CFLAGS) $< -c -o $@

######################################################################
# Phony targets follow.

.PHONY: clean

clean:
	rm -f $(OBJECTS) proot *.gcno *.gcda *.info
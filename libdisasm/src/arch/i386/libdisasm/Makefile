LIBNAME	= libdisasm.so
INCLUDE 	= -I.
FLAGS 	= $(INCLUDE)  -O3 -ggdb -march=i686
LFLAGS 	= $(FLAGS) -fPIC -shared -Wl,-soname,$(LIBNAME)
RM		= rm
CC		= gcc -m32

SRC		= 	libdis.c \
			i386_invariant.c \
			i386.c

all: libdis quikdis testdis

libdis:
	$(CC) $(LFLAGS) $(SRC) -o $(LIBNAME)

quikdis: libdis
	$(CC) $(FLAGS) -L. -ldisasm quikdis.c -o quikdis

testdis: libdis
	$(CC) $(FLAGS) -L. -ldisasm testdis.c -o testdis

clean:
	@$(RM) quikdis testdis  $(LIBNAME)

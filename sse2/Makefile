BASIC  = -O0
OPT    = -O3
CFLAGS = ${OPT} -g
# -march=skylake
#CFLAGS = ${BASIC} -g
CAFLAGS = -Wa,-adhln -g
#-S -dA -dp

all: rzf_double.x rzf_sse2.x 

rzf_double.x: rzf_double.c
	gcc -c ${CFLAGS} ${CAFLAGS} $< > rzf_double.S
	gcc ${CFLAGS} -o rzf_double.x $< -lm

rzf_sse2.x: rzf_sse2.c
	gcc -c ${CFLAGS} ${CAFLAGS} -msse2 $< > rzf_sse2.S
	gcc ${CFLAGS} -msse2 -o rzf_sse2.x $< -lm


clean:
	rm -f *.x *.S *.o

BASIC  = -O0
OPT    = -O3
CFLAGS = ${OPT} -g -mavx2
# -march=skylake
#CFLAGS = ${BASIC} -g
CAFLAGS = -Wa,-adhln -g
#-S -dA -dp

all: rzf_unroll_4.x rzf_unroll_8.x 

rzf_unroll_4.x: rzf_unroll_4.c
	gcc -c ${CFLAGS} ${CAFLAGS}  $< > rzf_unroll_4.S
	gcc ${CFLAGS} -o rzf_unroll_4.x $< -lm

rzf_unroll_8.x: rzf_unroll_8.c
	 gcc -c ${CFLAGS} ${CAFLAGS}  $< > rzf_unroll_8.S
	 gcc ${CFLAGS} -o rzf_unroll_8.x $< -lm

clean:
	rm -f *.x *.S *.o

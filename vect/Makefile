BASIC  = -O0
OPT    = -O3
CFLAGS = ${OPT} -g -mavx2
# -march=skylake
#CFLAGS = ${BASIC} -g
CAFLAGS = -Wa,-adhln -g
#-S -dA -dp

all: rzf_vect.x rzf_vect_2.x

rzf_vect.x: rzf_vect.c
	gcc -c ${CFLAGS} ${CAFLAGS}  $< > rzf_vect.S
	gcc ${CFLAGS} -o rzf_vect.x $< -lm

rzf_vect_2.x: rzf_vect_2.c
	 gcc -c ${CFLAGS} ${CAFLAGS}  $< > rzf_vect_2.S
	 gcc ${CFLAGS} -o rzf_vect_2.x $< -lm

clean:
	rm -f *.x *.S *.o

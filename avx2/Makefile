BASIC  = -O0
OPT    = -O3
CFLAGS = ${OPT} -g
# -march=skylake
#CFLAGS = ${BASIC} -g
CAFLAGS = -Wa,-adhln -g
#-S -dA -dp

all: rzf_double.x rzf_avx.x rzf_avx2.x rzf_avx512.x

rzf_double.x: rzf_double.c
	gcc -c ${CFLAGS} ${CAFLAGS} $< > rzf_double.S
	gcc ${CFLAGS} -o rzf_double.x $< -lm

rzf_avx.x: rzf_avx.c
	gcc -c ${CFLAGS} ${CAFLAGS} -mavx2 $< > rzf_avx.S
	gcc ${CFLAGS} -mavx2 -o rzf_avx.x $< -lm

rzf_avx2.x: rzf_avx2.c
	gcc -c ${CFLAGS} ${CAFLAGS} -mavx2 $< > rzf_avx2.S
	gcc ${CFLAGS} -mavx2 -march=skylake -o rzf_avx2.x $< -lm

rzf_avx512.x: rzf_avx512.c
		gcc -c ${CFLAGS} ${CAFLAGS} -mavx512f $< > rzf_avx512.S
		gcc ${CFLAGS} -mavx2 -march=skylake -o rzf_avx512.x $< -lm


clean:
	rm -f *.x *.S *.o

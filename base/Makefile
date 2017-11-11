BASIC  = -O0
OPT    = -O3
CFLAGS = ${OPT} -g
# -march=skylake
#CFLAGS = ${BASIC} -g
CAFLAGS = -Wa,-adhln -g
#-S -dA -dp

all: rzf_double_base.x rzf_base.x rzf_single_base.x

rzf_double_base.x: rzf_double_base.c
	gcc -c ${CFLAGS} ${CAFLAGS} $< > rzf_double_base.S
	gcc ${CFLAGS} -o rzf_double_base.x $< -lm

rzf_base.x: rzf_base.c
	gcc -c ${CFLAGS} ${CAFLAGS}  $< > rzf_base.S
	gcc ${CFLAGS} -o rzf_base.x $< -lm

rzf_single_base.x: rzf_single_base.c
	gcc -c ${CFLAGS} ${CAFLAGS}  $< > rzf_single_base.S
	gcc ${CFLAGS} -o rzf_single_base.x $< -lm


clean:
	rm -f *.x *.S *.o

BASIC  = -O0
OPT    = -O3
CFLAGS = ${OPT} -g
# -march=skylake
#CFLAGS = ${BASIC} -g
CAFLAGS = -Wa,-adhln -g
#-S -dA -dp

_avx        = $(shell grep avx     /proc/cpuinfo | sort | uniq | wc -l  )
_avx2       = $(shell grep avx2    /proc/cpuinfo | sort | uniq | wc -l  )
_avx512f    = $(shell grep avx512f /proc/cpuinfo | sort | uniq | wc -l  )

_all: rzf_double.x

ifneq ($(_avx),0)
_all += rzf_avx.x 
endif

ifneq ($(_avx2),0)
_all += rzf_avx2.x
endif

ifneq ($(_avx512f),0)
_all += rzf_avx512.x
endif

all: ${_all}


rzf_double.x: rzf_double.c
	gcc -c ${CFLAGS} ${CAFLAGS} $< > rzf_double.S
	gcc ${CFLAGS} -o rzf_double.x $< -lm

ifeq ($(_avx),1)
rzf_avx.x: rzf_avx.c
	gcc -c ${CFLAGS} ${CAFLAGS} -mavx2 $< > rzf_avx.S
	gcc ${CFLAGS} -mavx2 -o rzf_avx.x $< -lm
endif


rzf_avx2.x: rzf_avx2.c
	gcc -c ${CFLAGS} ${CAFLAGS} -mavx2 $< > rzf_avx2.S
	gcc ${CFLAGS} -mavx2 -march=skylake -o rzf_avx2.x $< -lm

rzf_avx512.x: rzf_avx512.c
		gcc -c ${CFLAGS} ${CAFLAGS} -mavx512f $< > rzf_avx512.S
		gcc ${CFLAGS} -mavx2 -march=skylake -o rzf_avx512.x $< -lm


clean:
	rm -f *.x *.S *.o

OPT    = -O3 -ffree-form -ffast-math
CFLAGS = ${OPT} -g
# -march=skylake
#CFLAGS = ${BASIC} -g
CAFLAGS = -Wa,-adhln -g
#-S -dA -dp

all: frzf.x 

frzf.x: frzf.f
	gfortran -c ${CFLAGS} ${CAFLAGS} $< > frzf.S
	gfortran ${CFLAGS} -o frzf.x $< 



clean:
	rm -f *.x *.S *.o

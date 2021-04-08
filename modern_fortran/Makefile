OPT    = -Ofast -ffast-math  -ffree-form -mtune=native -finline-functions -mavx2 -ftree-vectorize -faggressive-loop-optimizations -funsafe-math-optimizations
FFLAGS = ${OPT} 
CAFLAGS = -Wa,-adhln 
GFVER=-10
FC = gfortran${GFVER}


all: frzf.x 

frzf.x: frzf.f
	${FC} ${FFLAGS} -o frzf.x $< 


clean:
	rm -f *.x *.S *.o

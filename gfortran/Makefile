OPT    = -Ofast -ffast-math  -ffree-form -mtune=native -finline-functions -mavx2 -ftree-vectorize -faggressive-loop-optimizations -funsafe-math-optimizations
CFLAGS = ${OPT} 
CAFLAGS = -Wa,-adhln 
GFVER=-10

all: frzf.x frzf_vect.x frzf_vect_omp.x

frzf.x: frzf.f
	gfortran${GFVER} -c ${CFLAGS} ${CAFLAGS} $< > frzf.S
	gfortran${GFVER} ${CFLAGS} -o frzf.x $< 

frzf_vect.x: frzf_vect.f
	gfortran${GFVER} -c ${CFLAGS} ${CAFLAGS} $< > frzf_vect.S
	gfortran${GFVER} ${CFLAGS} -o frzf_vect.x $< 

frzf_vect_omp.x: frzf_vect_omp.f
	gfortran${GFVER} -c ${CFLAGS} ${CAFLAGS} -fopenmp $< > frzf_vect_omp.S
	gfortran${GFVER} ${CFLAGS} -fopenmp -o frzf_vect_omp.x $<



clean:
	rm -f *.x *.S *.o

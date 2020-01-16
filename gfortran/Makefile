OPT    = -O3 -ffree-form  
CFLAGS = ${OPT} -g
CAFLAGS = -Wa,-adhln -g
GFVER=-8

all: frzf.x frzf_opt1.x frzf_opt2.x

frzf.x: frzf.f
	gfortran${GFVER} -c ${CFLAGS} ${CAFLAGS} $< > frzf.S
	gfortran${GFVER} ${CFLAGS} -o frzf.x $< 

frzf_opt1.x: frzf_opt1.f
	gfortran${GFVER} -c ${CFLAGS} ${CAFLAGS} $< > frzf_opt1.S
	gfortran${GFVER} ${CFLAGS} -o frzf_opt1.x $< 

frzf_opt2.x: frzf_opt2.f
	gfortran${GFVER} -c ${CFLAGS} ${CAFLAGS} $< > frzf_opt2.S
	gfortran${GFVER} ${CFLAGS} -o frzf_opt2.x $<


clean:
	rm -f *.x *.S *.o

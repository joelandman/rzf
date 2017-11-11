BASIC  = -O0 
OPT    = -O3
CFLAGS = ${OPT} -g 
# -march=skylake
#CFLAGS = ${BASIC} -g
CAFLAGS = -Wa,-adhln -g 
#-S -dA -dp 

all: forward_backward_float.x forward_backward_double.x


forward_backward_float.x: forward_backward_float.c
	gcc -c ${CFLAGS} ${CAFLAGS}  $< > forward_backward_float.S
	gcc ${CFLAGS} -o forward_backward_float.x $< -lm

forward_backward_double.x: forward_backward_double.c
	gcc -c ${CFLAGS} ${CAFLAGS} $< > forward_backward_double.S 
	gcc ${CFLAGS} -o forward_backward_double.x $< -lm

clean:
	rm -f *.x *.S *.o

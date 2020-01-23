
CFLAGS	= -g -O0 -arch=sm_61

all: rzf_CUDA.x

rzf_CUDA.x: rzf_CUDA.cu
	nvcc ${CFLAGS} -o rzf_CUDA.x $<

clean:
	rm -f *.x *.S *.o



all: rzf_CUDA.x

rzf_CUDA.x: rzf_CUDA.c
	nvcc -o rzf_CUDA.x $<

clean:
	rm -f *.x *.S *.o

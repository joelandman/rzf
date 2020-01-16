include compiler.config 

packages = annotated  avx2  base  CUDA  gfortran  julia sse2  unroll  vect

build    = $(addsuffix .build,$(packages))
complete = $(addsuffix .complete,$(packages))

all:	    $(build) $(complete)

### generate the .build files
$(build):
	for p in $(packages) ; do    \
	    touch $$p.build ;	\
	done
	
%.complete: %.build
	cd $* ; $(MAKE) -f Makefile
	touch $*.complete

clean:
	for p in $(packages) ; do \
	    rm -f $$p.build $$p.packages $$p.complete ; \
	    cd $$p ; $(MAKE) -f Makefile clean ; \
	done

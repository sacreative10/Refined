UNAME := $(shell uname)
compile:
	echo $(shell uname)
ifeq ($(UNAME), MSYS_NT-10.0-17763)
	clang++ -c src/main.cpp -o build/app.o -Iinclude/
	clang++ build/app.o -o build/bin/app.exe -lopengl32 -lgdi32 -lwinmm -Lbuild/bin/ -lraylib
endif
ifeq ($(UNAME), Linux)
	clang++ -c src/main.cpp -o build/app.o -Iinclude/
	clang++ build/app.o -o build/bin/app -lGL -lm -lpthread -ldl -lrt -lX11 -Lbuild/bin/ -lraylib  
endif


install:
	mkdir -p build/
	mkdir -p build/bin/
	mkdir -p tmp/
	mkdir -p include/
	git clone https://github.com/raysan5/raylib.git tmp/raylib
ifeq ($(UNAME), MSYS_NT-10.0-17763)
	cd /tmp/raylib/src/ && mingw32-make -j4 PLATFORM_DESKTOP RAYLIB_LIBTYPE=STATIC
endif
ifeq ($(UNAME), Linux)
	cd tmp/raylib/src/ && $(MAKE) -f Makefile -j4 PLATFORM=PLATFORM_DESKTOP RAYLIB_LIBTYPE=STATIC
endif
	cp tmp/raylib/src/libraylib.a build/bin/
	cp tmp/raylib/src/raylib.h include/ 
	cp tmp/raylib/src/rlgl.h include/


run:
	./build/bin/app

clean:
	rm -rf build/
	rm -rf tmp/

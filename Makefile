UNAME := $(shell uname)
compile:
ifeq ($(UNAME), WINDOWS_NT)
	g++ -c src/main.cpp -o build/app.o -Iinclude/
	g++ build/app.o -o build/bin/app -lpthread -Lbuild/bin/ -lraylib -lopengl32 -lgdi32 -lwinmm
endif
ifeq ($(UNAME), Linux)
	g++ -c src/main.cpp -o build/app.o -Iinclude/
	g++ build/app.o -o build/bin/app -lGL -lm -lpthread -ldl -lrt -lX11 -Lbuild/bin/ -lraylib  
endif


install:
	mkdir -p build/
	mkdir -p build/bin/
	mkdir -p tmp/
	mkdir -p include/
	git clone https://github.com/raysan5/raylib.git tmp/raylib
	cd tmp/raylib/src/ && $(MAKE) -f Makefile -j4 PLATFORM=PLATFORM_DESKTOP RAYLIB_LIBTYPE=STATIC
	cp tmp/raylib/src/libraylib.a build/bin/
	cp tmp/raylib/src/raylib.h include/ 
	cp tmp/raylib/src/rlgl.h include/


run:
	./build/bin/app

clean:
	rm -rf build/
	rm -rf tmp/

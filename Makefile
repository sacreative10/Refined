install:
	mkdir -p build/
	mkdir -p build/bin/
	mkdir -p tmp/
	mkdir -p include/
	git clone https://github.com/raysan5/raylib.git tmp/raylib
	cd tmp/raylib/src/ && $(MAKE) -f Makefile -j4 PLATFORM=PLATFORM_DESKTOP RAYLIB_LIBTYPE=STATIC
	cp tmp/raylib/src/libraylib.a build/bin/
	cp tmp/raylib/src/raylib.h include/ 

compile:
	clang++ -c src/main.cpp -o build/app.o -Iinclude/
	clang++ build/app.o -o build/bin/app -lpthread -lX11 -lm -lGL -ldl -lrt -Lbuild/bin/ -lraylib  

run:
	./build/bin/app

clean:
	rm -rf build/
	rm -rf tmp/

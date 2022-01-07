install:
	mkdir -p build/
	mkdir -p build/bin/

compile:
	clang++ -c src/main.cpp -o build/app.o
	clang++ build/app.o -o build/bin/app -lpthread -lsfml-graphics -lsfml-window -lsfml-system 

run:
	./build/bin/app

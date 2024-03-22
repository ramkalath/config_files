all:
	g++ -g -std=c++17 -O2 -w $(INCLUDE) main.cpp $(LIBS) -o main

run:
	./main

debug:
	mkdir ./build
	cd ./build && \
	cp ~/config_files/cpp/cpp_templates/CMakeLists.txt . && \
	cmake -G "CodeBlocks - Unix Makefiles" . && \
	codeblocks main.cbp &! > /dev/null

clean:
	rm main
	rm -rf build

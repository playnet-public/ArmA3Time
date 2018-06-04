
CPPFLAGS=-Wall -fPIC -pthread -std=c++11
OBJS=src/main.o
LDFLAGS=-shared -pthread -fPIC
OUTPUT=""

linux64: prepare clean build_obj_linux_x64 link
linux32: prepare clean build_obj_linux_x32 link

prepare:
	@mkdir -p .build/

build_obj_linux_x64: $(OBJS)
	$(eval OUTPUT=.build/arma3time_x64.so)

build_prep_linux_x32:
	$(eval CPPFLAGS+= -m32)
	$(eval LDFLAGS+= -m32)

build_obj_linux_x32: build_prep_linux_x32 $(OBJS)
	$(eval LIBS=$(LIBS_x32))
	$(eval OUTPUT=.build/arma3time.so)

%.o: %.cpp
	@echo "\tCXX\t\t$@"
	@$(CXX) $(CPPFLAGS) -c $< -o $@

link:
	@echo "\tLD\t\t$(OUTPUT)"
	@$(CXX) $(LDFLAGS) $(OBJ) -o $(OUTPUT)

clean:
	@echo "\tCLEANUP"
	@rm -f src/*.o

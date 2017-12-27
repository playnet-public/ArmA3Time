
#!/bin/bash

cd ../
g++ -shared \
    -fPIC \
    -o arma3time_x64.so \
    src/main.cpp \
    -std=c++11


#!/bin/bash

cd ../
g++ -shared \
    -fPIC \
    -m32 \
    -o arma3time.so \
    src/main.cpp\
    -std=c++11


cd ..\
cl /MD /LD /Fe:arma3time_x64.dll^
    src\main.cpp
rm *.obj
rm *.lib
rm *.exp
cd tools

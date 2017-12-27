
cd ..\
cl /MD /LD /Fe:arma3time.dll^
    src\main.cpp^
rm *.obj
rm *.lib
rm *.exp
cd tools

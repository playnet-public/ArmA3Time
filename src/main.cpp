
#include <stdio.h>
#include <ctime>
#include <string>

#define VERSION "0.1"

#ifndef __linux__

#include <windows.h>
#include <shellapi.h>

#endif

extern "C"
{
    #ifdef __linux__
    
    void RVExtension(char *output, int outputSize, const char *function);
    void RVExtensionVersion(char *output, int outputSize);

    #else

    __declspec(dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function);
    __declspec(dllexport) void __stdcall RVExtensionVersion(char *output, int outputSize);

    #endif
};

#ifdef __linux__

void RVExtensionVersion(char *output, int outputSize)
{
	strncpy(output, VERSION, outputSize);
};

void RVExtension(char *output, int outputSize, const char *function)
{
    std::time_t t = std::time(nullptr);
    std::string(t) s;
    strncpy(output, s.c_str(), outputSize);
};

#else

void __stdcall RVExtensionVersion(char *output, int outputSize)
{
	strncpy(output, VERSION, outputSize);
};

void __stdcall RVExtensionArgs(char *output, int outputSize, const char *function, const char **args, int argsCnt)
{
    std::time_t t = std::time(nullptr);
    std::string s = std::to_string(t);
    strncpy(output, s.c_str(), outputSize);
};

#endif

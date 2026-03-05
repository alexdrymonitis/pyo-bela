#pragma once

#include "m_pyo.h"
#include <vector>
#include <string>

typedef int callPtr(int);

class Pyo {
    public:
        ~Pyo();
        void setup(int nChannels, int bufferSize, int sampleRate, int nAnalogChannels);
        void process(float *buffer);
        void fillin(const float *buffer);
        void analogin(const float *buffer);
        void analogout(float *buffer);
        void clear();
        void midievent(int status, int data1, int data2);
        int loadfile(const char *file, int add);
        int exec(const char *msg);
        int value(const char *name, float value);
        int value(const char *name, float *value, int len);
        int set(const char *name, float value);
        int set(const char *name, float *value, int len);
		void setDebug(int debugState);
		std::vector<std::string> getStdout();
		std::string getErrorMsg();

    private:
        int inChannels;
        int outChannels;
        int bufferSize;
        int sampleRate;
        int nAnalogChannels;
        int nTotalChannels;
		int debug;
        PyThreadState *interpreter;
        float *pyoInBuffer;
        float *pyoOutBuffer;
        callPtr *pyoCallback;
        int pyoId;
        char pyoMsg[262144];
};

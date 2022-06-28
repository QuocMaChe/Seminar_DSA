#include <fstream>
#include <string>
#include"dataGenerator.h"
#include"sort.h"

using namespace std;

void execCommand1(char* algorithm, char* inputFile, char* outParameter);
void execCommand2(char* algorithm, long size, char* order, char* outParameter);
void execCommand3(char* algorithm, long size, char* outParameter);
void execCommand4(char* algorithm1, char* algorithm2, char* inputFile);
void execCommand5(char* algorithm1, char* algorithm2, long size, char* order);

void sortingData(char* algorithm, int* data, long size, long long& count_comp, double& timeUsed);

void runCommand(int argc, char* argv[]);
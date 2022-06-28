#include "inputHandler.h"


void runCommand(int argc, char* argv[]) {
	if (argc > 4 && argc < 7) {
		if (strcmp(argv[1], "-a") == 0) {
			//if argv[3] is a number --> command 2 or 3.
			long dataSize = strtol(argv[3], &argv[3], 10);

			if (dataSize > 0) {
				//Case: command 3
				if (argc == 5) {
					execCommand3(argv[2], dataSize, argv[4]);
				}
				//Command 2
				else {
					execCommand2(argv[2], dataSize, argv[4], argv[5]);
				}
			}
			//Command 1
			else {
				execCommand1(argv[2], argv[3], argv[4]);
			}
		}
		else if (strcmp(argv[1], "-c") == 0) {
			// if argv[4] is a number-- > command 5.
			long dataSize = strtol(argv[4], &argv[4], 10);
			if (dataSize > 0) {
				//Case: command 5
				execCommand5(argv[2], argv[3], dataSize, argv[5]);
			}
			//Command 4
			else {
				execCommand4(argv[2], argv[3], argv[4]);
			}	
		}
	}
	else {
		cout << "Cannot find prototype for your command." << endl;
	}
}

//Command 1
void execCommand1(char* algorithm, char* inputFile, char* outParameter) {
	ifstream inFile(inputFile);

	if (inFile.is_open()) {
		string firstLine;
		getline(inFile, firstLine);

		int dataSize = stoi(firstLine);
		int* data = new int[dataSize];

		for (int i = 0; i < dataSize; i++) {
			inFile >> data[i];
		}
		inFile.close();

		//output set
		int doPrintTime = 0;
		int doPrintComp = 0;
		if (strcmp(outParameter, "-time") == 0) {
			doPrintTime++;
		}
		else if (strcmp(outParameter, "-comp") == 0) {
			doPrintComp++;
		}
		else if (strcmp(outParameter, "-both") == 0) {
			doPrintComp++;
			doPrintTime++;
		}

		//Printing arguments
		cout << "ALGORITHM MODE" << endl;
		cout << "Algorithm: " << algorithm << endl;
		cout << "Input size: " << dataSize << endl;
		cout << "--------------------------------------" << endl;

		//sort the array
		long long count_comp = 0;
		double timeUsed = 0;
		sortingData(algorithm, data, dataSize, count_comp, timeUsed);
		if (doPrintTime)
			cout << "Running time: " << timeUsed << "ms" << endl;
		if (doPrintComp)
			cout << "Comparisons: " << count_comp << endl;

		//writing sorted array to input.txt
		ofstream sortedInputFile;
		sortedInputFile.open("output.txt");
		sortedInputFile << dataSize << "\n";
		for (int i = 0; i < dataSize; i++)
			sortedInputFile << data[i] << " ";
		sortedInputFile.close();
	}
	else {
		cout << "Error opening file!" << endl;
	}
}

//command 2
void execCommand2(char* algorithm, long size, char* order, char* outParameter) {
	if (size < 0 || size > 500000) {
		cout << "Invalid size" << endl;
		return;
	}
	int* data = new int[size];
	string dataOrder;

	//generate data
	if (strcmp(order, "-rand") == 0) {
		GenerateData(data, size, 0);
		dataOrder = "Randomize data";
	}
	else if (strcmp(order, "-nsorted") == 0) {
		GenerateData(data, size, 3);
		dataOrder = "Nearly sorted data";
	}
	else if (strcmp(order, "-sorted") == 0) {
		GenerateData(data, size, 1);
		dataOrder = "sorted data";
	}
	else if (strcmp(order, "-rev") == 0) {
		GenerateData(data, size, 2);
		dataOrder = "Reverse sorted data";
	}
	else {
		cout << "Invalid data order!" << endl;
		return;
	}

	//output set
	int doPrintTime = 0;
	int doPrintComp = 0;
	if (strcmp(outParameter, "-time") == 0) {
		doPrintTime++;
	}
	else if (strcmp(outParameter, "-comp") == 0) {
		doPrintComp++;
	}
	else if (strcmp(outParameter, "-both") == 0) {
		doPrintComp++;
		doPrintTime++;
	}

	//Printing arguments
	cout << "ALGORITHM MODE" << endl;
	cout << "Algorithm: " << algorithm << endl;
	cout << "Input size: " << size << endl;
	cout << "Input order: " << dataOrder << endl;
	cout << "--------------------------------------" << endl;

	//Writing generated data to input.txt
	ofstream outFile;
	outFile.open("input.txt");
	outFile << size << "\n";
	for (int i = 0; i < size; i++)
		outFile << data[i] << " ";
	outFile.close();

	//sort the array
	long long count_comp = 0;
	double timeUsed = 0;
	sortingData(algorithm, data, size, count_comp, timeUsed);
	if (doPrintTime)
			cout << "Running time: " << timeUsed << "ms" << endl;
	if (doPrintComp)
		cout << "Comparisons: " << count_comp << endl;

	//writing sorted array to output.txt
	ofstream sortedInputFile;
	sortedInputFile.open("output.txt");
	sortedInputFile << size << "\n";
	for (int i = 0; i < size; i++)
		sortedInputFile << data[i] << " ";
	sortedInputFile.close();
}


//Command 3
void execCommand3(char* algorithm, long size, char* outParameter) {
	if (size < 0 || size > 500000) {
		cout << "Invalid size" << endl;
		return;
	}

	// generate data
	int** data = new int* [4];
	for (int i = 0; i < 4; ++i) {
		data[i] = new int[size];
		GenerateData(data[i], size, i);
	}

	//output set
	int doPrintTime = 0;
	int doPrintComp = 0;
	if (strcmp(outParameter, "-time") == 0) {
		doPrintTime++;
	}
	else if (strcmp(outParameter, "-comp") == 0) {
		doPrintComp++;
	}
	else if (strcmp(outParameter, "-both") == 0) {
		doPrintComp++;
		doPrintTime++;
	}

	//Printing arguments
	cout << "ALGORITHM MODE" << endl;
	cout << "Algorithm: " << algorithm << endl;
	cout << "Input size: " << size;

	//Writing generated data to output.txt
	ofstream outputFile1;
	ofstream outputFile2;
	ofstream outputFile3;
	ofstream outputFile4;

	outputFile1.open("input_1.txt");
	outputFile2.open("input_2.txt");
	outputFile3.open("input_3.txt");
	outputFile4.open("input_4.txt");

	outputFile1 << size << "\n";
	outputFile2 << size << "\n";
	outputFile3 << size << "\n";
	outputFile4 << size << "\n";

	for (int i = 0; i < 4; i++)
		for (int j = 0; j < size; j++) {
			outputFile1 << data[i][j] << " ";
			outputFile3 << data[i][j] << " ";
			outputFile4 << data[i][j] << " ";
			outputFile2 << data[i][j] << " ";
		}
	outputFile1.close();
	outputFile2.close();
	outputFile3.close();
	outputFile4.close();

	//sort the array
	for (int i = 0; i < 4; i++) {
		switch (i)
		{
		case 0:
			cout << endl << "Input order: Randomize" << endl;
			cout << "-------------------------" << endl;
			break;
		case 1:
			cout << endl << "Input order: Sorted" << endl;
			cout << "-------------------------" << endl;
			break;
		case 2:
			cout << endl << "Input order: Reversed" << endl;
			cout << "-------------------------" << endl;
			break;
		case 3:
			cout << endl << "Input order: Nearly Sorted" << endl;
			cout << "-------------------------" << endl;
			break;
		};

		//sorting data
		long long count_comp = 0;
		double timeUsed = 0;
		sortingData(algorithm, data[i], size, count_comp, timeUsed);
		if (doPrintTime)
			cout << "Running time: " << timeUsed << "ms" << endl;
		if (doPrintComp)
			cout << "Comparisons: " << count_comp << endl;
	}
}

//Command 4
void execCommand4(char* algorithm1, char* algorithm2, char* inputFile) {
	ifstream inFile(inputFile);

	if (inFile.is_open()) {
		string firstLine;
		getline(inFile, firstLine);

		int dataSize = stoi(firstLine);
		int* data1 = new int[dataSize];
		int* data2 = new int[dataSize];

		for (int i = 0; i < dataSize; i++) {
			inFile >> data1[i];
			data2[i] = data1[i];
		}
		inFile.close();


		//Printing arguments
		cout << "COMPARE MODE" << endl;
		cout << "Algorithm: " << algorithm1 << " | " << algorithm2 << endl;
		cout << "Input size: " << dataSize << endl;
		cout << "--------------------------------------" << endl;

		//sort the array
		long long count_comp1 = 0;
		long long count_comp2 = 0;
		double timeUsed1 = 0;
		double timeUsed2 = 0;
		sortingData(algorithm1, data1, dataSize, count_comp1, timeUsed1);
		sortingData(algorithm2, data2, dataSize, count_comp2, timeUsed2);
		cout << "Running time: " << timeUsed1 << "ms" << " | " << timeUsed2 << "ms" << endl;
		cout << "Comparisons: " << count_comp1 << " | " << count_comp2 << endl;
	}
	else {
		cout << "Error opening file!" << endl;
	}
}

//Command 5
void execCommand5(char* algorithm1, char* algorithm2, long size, char* order) {
	if (size < 0 || size > 500000) {
		cout << "Invalid size" << endl;
		return;
	}
	int* data1 = new int[size];
	int* data2 = new int[size];

	//generate data
	if (strcmp(order, "-rand") == 0) {
		GenerateData(data1, size, 0);
		for (int i = 0; i < size; i++)
			data2[i] = data1[i];
	}
	else if (strcmp(order, "-nsorted") == 0) {
		GenerateData(data1, size, 3);
		for (int i = 0; i < size; i++)
			data2[i] = data1[i];
	}
	else if (strcmp(order, "-sorted") == 0) {
		GenerateData(data1, size, 1);
		for (int i = 0; i < size; i++)
			data2[i] = data1[i];
	}
	else if (strcmp(order, "-rev") == 0) {
		GenerateData(data1, size, 2);
		for (int i = 0; i < size; i++)
			data2[i] = data1[i];
	}
	else {
		cout << "Invalid data order!" << endl;
		return;
	}

	//Printing arguments
	cout << "COMPARE MODE" << endl;
	cout << "Algorithm: " << algorithm1 << " | " << algorithm2 << endl;
	cout << "Input size: " << size << endl;
	cout << "--------------------------------------" << endl;

	//Writing generated data to input.txt
	ofstream outFile;
	outFile.open("input.txt");
	outFile << size << "\n";
	for (int i = 0; i < size; i++)
		outFile << data1[i] << " ";
	outFile.close();

	//sort the array
	long long count_comp1 = 0;
	long long count_comp2 = 0;
	double timeUsed1 = 0;
	double timeUsed2 = 0;
	sortingData(algorithm1, data1, size, count_comp1, timeUsed1);
	sortingData(algorithm2, data2, size, count_comp2, timeUsed2);
	cout << "Running time: " << timeUsed1 << "ms" << " | " << timeUsed2 << "ms" << endl;
	cout << "Comparisons: " << count_comp1 << " | " << count_comp2 << endl;

}
void sortingData(char* algorithm, int* data, long size, long long& count_comp, double& timeUsed) {
	if (strcmp(algorithm, "selection-sort") == 0) {
		auto begin = clock();
		selectionSort(data, size, count_comp);
		timeUsed = ((double)clock() - begin);
		
	}

	else if (strcmp(algorithm, "insertion-sort") == 0) {
		auto begin = clock();
		insertionSort(data, size, count_comp);
		timeUsed = ((double)clock() - begin);

	}
	else if (strcmp(algorithm, "bubble-sort") == 0) {
		auto begin = clock();
		bubbleSort(data, size, count_comp);
		timeUsed = ((double)clock() - begin);

	}
	else if (strcmp(algorithm, "shaker-sort") == 0) {
		auto begin = clock();
		shakerSort(data, size, count_comp);
		timeUsed = ((double)clock() - begin);
	
	}
	else if (strcmp(algorithm, "shell-sort") == 0) {
		auto begin = clock();
		shellSort(data, size, count_comp);
		timeUsed = ((double)clock() - begin);

	}
	else if (strcmp(algorithm, "heap-sort") == 0) {
		auto begin = clock();
		heapSort(data, size, count_comp);
		timeUsed = ((double)clock() - begin);

	}
	else if (strcmp(algorithm, "merge-sort") == 0) {
		auto begin = clock();
		mergeSort(data, 0, size - 1, count_comp);
		timeUsed = ((double)clock() - begin);

	}
	else if (strcmp(algorithm, "quick-sort") == 0) {
		auto begin = clock();
		quickSort(data, 0, size - 1, count_comp);
		timeUsed = ((double)clock() - begin);

	}
	else if (strcmp(algorithm, "counting-sort") == 0) {
		auto begin = clock();
		countingSort(data, size, count_comp);
		timeUsed = ((double)clock() - begin);

	}
	else if (strcmp(algorithm, "radix-sort") == 0) {
		auto begin = clock();
		radixSort(data, size, count_comp);
		timeUsed = ((double)clock() - begin);

	}
	else if (strcmp(algorithm, "flash-sort") == 0) {
		auto begin = clock();
		flashSort(data, size, count_comp);
		timeUsed = ((double)clock() - begin);

	}
}

#include "inputHandler.h"
using namespace std;

void forDataChart();
int main(int argc, char* argv[])
{
	runCommand(argc, argv);

	//test
	/*char alg[] = "heap-sort"; 
	long size = 500;
	char out[] = "-both";
	execCommand3(alg, size, out);*/
	return 0;
}
//Get data for chart
void forDataChart()
{
	int dataSize[6] = { 10000,30000,50000,100000,300000,500000 };
	int dataOrder = 0;
	while (dataOrder < 4)
	{
		switch (dataOrder)
		{
		case 0:
			cout << "Random data" << endl;
			break;
		case 1:
			cout << "Sorted data" << endl;
			break;
		case 2:
			cout << "Reverse data" << endl;
			break;
		case 3:
			cout << "Nearly sorted data" << endl;
			break;
		};
		for (int i = 0; i < 6; i++)
		{
			long long count_comp = 0;
			int n = dataSize[i];
			int* a = new int[n];
			int* b = new int[n];
			GenerateData(a, n, dataOrder);
			cout << "---------- " << n << " elements ----------" << endl;
			for (int i = 0; i < n; i++)
				b[i] = a[i];
			auto begin = clock();
			selectionSort(b, n, count_comp);
			double timeUsed = ((double)clock() - begin);
			cout << "Selection sort: " << timeUsed << "ms" << endl;
			cout << "Comparisons: " << count_comp << endl;

			count_comp = 0;
			for (int i = 0; i < n; i++)
				b[i] = a[i];
			begin = clock();
			insertionSort(b, n, count_comp);
			timeUsed = ((double)clock() - begin);
			cout << "\nInsertion sort: " << timeUsed << "ms" << endl;
			cout << "Comparisons: " << count_comp << endl;

			count_comp = 0;
			for (int i = 0; i < n; i++)
				b[i] = a[i];
			begin = clock();
			bubbleSort(b, n, count_comp);
			timeUsed = ((double)clock() - begin);
			cout << "\nBubble sort: " << timeUsed << "ms" << endl;
			cout << "Comparisons: " << count_comp << endl;

			count_comp = 0;
			for (int i = 0; i < n; i++)
				b[i] = a[i];
			begin = clock();
			shakerSort(b, n, count_comp);
			timeUsed = ((double)clock() - begin);
			cout << "\nShaker sort: " << timeUsed << "ms" << endl;
			cout << "Comparisons: " << count_comp << endl;

			count_comp = 0;
			for (int i = 0; i < n; i++)
				b[i] = a[i];
			begin = clock();
			shellSort(b, n, count_comp);
			timeUsed = ((double)clock() - begin);
			cout << "\nShell sort: " << timeUsed << "ms" << endl;
			cout << "Comparisons: " << count_comp << endl;

			count_comp = 0;
			for (int i = 0; i < n; i++)
				b[i] = a[i];
			begin = clock();
			heapSort(b, n, count_comp);
			timeUsed = ((double)clock() - begin);
			cout << "\nHeap sort: " << timeUsed << "ms" << endl;
			cout << "Comparisons: " << count_comp << endl;

			count_comp = 0;
			for (int i = 0; i < n; i++)
				b[i] = a[i];
			begin = clock();
			mergeSort(b, 0, n - 1, count_comp);
			timeUsed = ((double)clock() - begin);
			cout << "\nMerge sort: " << timeUsed << "ms" << endl;
			cout << "Comparisons: " << count_comp << endl;

			count_comp = 0;
			for (int i = 0; i < n; i++)
				b[i] = a[i];
			begin = clock();
			quickSort(b, 0, n - 1, count_comp);
			timeUsed = ((double)clock() - begin);
			cout << "\nQuick sort: " << timeUsed << "ms" << endl;
			cout << "Comparisons: " << count_comp << endl;

			count_comp = 0;
			for (int i = 0; i < n; i++)
				b[i] = a[i];
			begin = clock();
			countingSort(b, n, count_comp);
			timeUsed = ((double)clock() - begin);
			cout << "\nCounting sort: " << timeUsed << "ms" << endl;
			cout << "Comparisons: " << count_comp << endl;

			count_comp = 0;
			for (int i = 0; i < n; i++)
				b[i] = a[i];
			begin = clock();
			radixSort(b, n, count_comp);
			timeUsed = ((double)clock() - begin);
			cout << "\nRadix sort: " << timeUsed << "ms" << endl;
			cout << "Comparisons: " << count_comp << endl;

			count_comp = 0;
			for (int i = 0; i < n; i++)
				b[i] = a[i];
			begin = clock();
			flashSort(b, n, count_comp);
			timeUsed = ((double)clock() - begin);
			cout << "\nFlash sort: " << timeUsed << "ms" << endl;
			cout << "Comparisons: " << count_comp << endl;

			cout << endl;
			delete[] a;
			delete[] b;

		}
		dataOrder++;
	}
}
#include"dataGenerator.h"
#include"sort.h"
using namespace std;

void selectionSort(int* a, int n, long long& count_comp)
{
	count_comp = 0;
	for (int i = 0; ++count_comp && i < n - 1; i++)
	{
		//Tìm phần tử nhỏ nhất trong mảng chưa sắp xếp
		int min = i;
		for (int j = i + 1; ++count_comp && j < n; j++)
		{
			if (++count_comp && a[j] < a[min])
				min = j;
		}
		HoanVi(a[i], a[min]);
	}
}

void insertionSort(int* a, int n, long long& count_comp)
{
	int hole, value;
	for (int i = 1; ++count_comp && i < n; i++)
	{
		value = a[i];
		hole = i;
		while (++count_comp && hole > 0 && a[hole - 1] > value)
		{
			a[hole] = a[hole - 1];
			hole = hole - 1;
		}
		a[hole] = value;
	}
}

void bubbleSort(int* a, int n, long long& count_comp)
{
	count_comp = 0;
	int i, j;
	bool swapped;
	for (i = 0; ++count_comp && i < n - 1; i++)
	{
		swapped = false;
		for (j = 0; ++count_comp && j < n - i - 1; j++)
		{
			if (++count_comp && a[j] > a[j + 1])
			{
				HoanVi(a[j], a[j + 1]);
				swapped = true;
			}
		}
		if (++count_comp && swapped == false)
			break;
	}
}

void shakerSort(int* a, int n, long long& count_comp)
{
	count_comp = 0;
	int left = 0;
	int right = n - 1;
	int k = 0;
	while (++count_comp&& left < right)
	{
		for (int i = left; ++count_comp && i < right; i++)
		{
			if (++count_comp && a[i] > a[i + 1])
			{
				HoanVi(a[i], a[i + 1]);
				k = i;
			}
		}
		right = k;
		for (int i = right; ++count_comp && i > left; i--)
		{
			if (++count_comp&& a[i] < a[i - 1])
			{
				HoanVi(a[i], a[i - 1]);
				k = i;
			}
		}
		left = k;
	}
}

void shellSort(int* a, int n, long long& count_comp)
{
	count_comp = 0;
	for (int gap = n / 2; ++count_comp && gap > 0; gap /= 2)
	{
		for (int i = gap; ++count_comp && i < n; i += 1)
		{
			int temp = a[i];
			int j;
			for (j = i; ++count_comp && j >= gap && a[j - gap] > temp; j -= gap)
				a[j] = a[j - gap];
			a[j] = temp;
		}
	}
}

void heapify(int* a, int n, int i, long long& count_comp)
{
	int largest = i;
	int left = 2 * i + 1;
	int right = 2 * i + 2;

	//if left child is larger than root
	if (++count_comp && left < n && a[left]>a[largest])
		largest = left;

	if (++count_comp && right<n && a[right]>a[largest])
		largest = right;

	if (++count_comp && largest != i)
	{
		HoanVi(a[i], a[largest]);
		heapify(a, n, largest, count_comp);
	}
}

void heapSort(int* a, int n, long long& count_comp)
{
	count_comp = 0;
	//Build heap
	for (int i = n / 2 - 1; ++count_comp && i >= 0; i--)
		heapify(a, n, i, count_comp);

	for (int i = n - 1; +count_comp && i > 0; i--)
	{
		HoanVi(a[0], a[i]);
		heapify(a, i, 0, count_comp);
	}
}

void merge(int a[], int left, int mid, int right, long long& count_comp)
{
	int n1 = mid - left + 1;
	int n2 = right - mid;

	int* L = new int[n1];
	int* R = new int[n2];

	for (int i = 0; ++count_comp && i < n1; i++)
		L[i] = a[left + i];
	for (int j = 0; ++count_comp && j < n2; j++)
		R[j] = a[mid + 1 + j];

	int i = 0;
	int j = 0;
	int k = left;

	while (++count_comp && i < n1 && j < n2)
	{
		if (++count_comp && L[i] <= R[j])
		{
			a[k] = L[i];
			i++;
		}
		else
		{
			a[k] = R[j];
			j++;
		}
		k++;
	}

	while (++count_comp && i < n1)
	{
		a[k] = L[i];
		i++;
		k++;
	}

	while (++count_comp && j < n2)
	{
		a[k] = R[j];
		j++;
		k++;
	}
}

void mergeSort(int* a, int left, int right, long long& count_comp)
{
	if (++count_comp && left < right)
	{
		int mid = left + (right - left) / 2;
		mergeSort(a, left, mid, count_comp);
		mergeSort(a, mid + 1, right, count_comp);
		merge(a, left, mid, right, count_comp);
	}
}

int partition(int* a, int low, int high, long long& count_comp)
{
	//median pivot
	int pivot = a[(low + high) / 2];
	int i = low - 1;
	for (int j = low; ++count_comp && j <= high - 1; j++)
	{
		if (++count_comp && a[j] < pivot)
		{
			i++;
			HoanVi(a[i], a[j]);
		}
	}
	HoanVi(a[i + 1], a[high]);
	return i + 1;
}

void quickSort(int* a, int low, int high, long long& count_comp)
{
	if (low < high)
	{
		int pIndex = partition(a, low, high, count_comp);
		quickSort(a, low, pIndex - 1, count_comp);
		quickSort(a, pIndex + 1, high, count_comp);
	}
}

void countingSort(int* a, int n, long long& count_comp)
{
	count_comp = 0;
	int* output = new int[n];
	int max = a[0];

	for (int i = 1; ++count_comp && i < n; i++)
	{
		if (++count_comp && a[i] > max)
			max = a[i];
	}

	int* count = new int[max + 1];

	for (int i = 0; ++count_comp && i <= max; i++)
		count[i] = 0;

	for (int i = 0; ++count_comp && i < n; i++)
		count[a[i]]++;

	for (int i = 1; ++count_comp && i <= max; i++)
		count[i] += count[i - 1];

	for (int i = n - 1; ++count_comp && i >= 0; i--)
	{
		output[count[a[i]] - 1] = a[i];
		count[a[i]]--;
	}

	for (int i = 0; ++count_comp && i < n; i++)
		a[i] = output[i];

	delete[] count;
	delete[] output;
}

void radixSort(int* a, int n, long long& count_comp)
{
	count_comp = 0;
	int* output = new int[n];
	int max = a[0], exp = 1;

	for (int i = 0; ++count_comp && i < n; i++)
		if (++count_comp && a[i] > max)
			max = a[i];

	while (++count_comp && max / exp > 0)
	{
		int bucket[10] = { 0 };
		for (int i = 0; ++count_comp && i < n; i++)
			bucket[a[i] / exp % 10]++;
		for (int i = 1; ++count_comp && i < 10; i++)
			bucket[i] += bucket[i - 1];
		for (int i = n - 1; ++count_comp && i >= 0; i--)
			output[--bucket[a[i] / exp % 10]] = a[i];
		for (int i = 0; ++count_comp && i < n; i++)
			a[i] = output[i];
		exp *= 10;
	}
	delete[] output;
}

void flashSort(int* a, int n, long long& count_comp)
{
	count_comp = 0;
	int minVal = a[0];
	int max = 0;
	int m = int(0.45 * n);
	int* l = new int[m];
	for (int i = 0; ++count_comp && i < m; i++)
		l[i] = 0;
	for (int i = 1; ++count_comp && i < n; i++)
	{
		if (++count_comp && a[i] < minVal)
			minVal = a[i];
		if (++count_comp && a[i] > a[max])
			max = i;
	}
	if (++count_comp && a[max] == minVal)
		return;
	double c1 = (double)(m - 1) / (a[max] - minVal);
	for (int i = 0; ++count_comp && i < n; i++)
	{
		int k = int(c1 * (a[i] - minVal));
		++l[k];
	}
	for (int i = 1; ++count_comp && i < m; i++)
		l[i] += l[i - 1];
	HoanVi(a[max], a[0]);
	int nmove = 0;
	int j = 0;
	int k = m - 1;
	int t = 0;
	int flash;
	while (++count_comp && nmove < n - 1)
	{
		while (++count_comp && j > l[k] - 1)
		{
			j++;
			k = int(c1 * (a[j] - minVal));
		}
		flash = a[j];
		if (k < 0) break;
		while (++count_comp && j != l[k])
		{
			k = int(c1 * (flash - minVal));
			int hold = a[t = --l[k]];
			a[t] = flash;
			flash = hold;
			++nmove;
		}
	}
	delete[] l;
	insertionSort(a, n, count_comp);
}


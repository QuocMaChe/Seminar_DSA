#pragma once
#include<iostream>

using namespace std;

void selectionSort(int* a, int n, long long& count_comp);
void insertionSort(int* a, int n, long long& count_comp);
void bubbleSort(int* a, int n, long long& count_comp);
void shakerSort(int* a, int n, long long& count_comp);
void shellSort(int* a, int n, long long& count_comp);
// Heap sort
void heapify(int* a, int n, int i, long long& count_comp);
void heapSort(int* a, int n, long long& count_comp);
// Merge sort
void merge(int a[], int left, int mid, int right, long long& count_comp);
void mergeSort(int* a, int left, int right, long long& count_comp);
// Quick sort
int partition(int* a, int low, int high, long long& count_comp);
void quickSort(int* a, int low, int high, long long& count_comp);

void countingSort(int* a, int n, long long& count_comp);
// Radix sort
void radixSort(int* a, int n, long long& count_comp);
void flashSort(int* a, int n, long long& count_comp);
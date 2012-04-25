#include <iostream>
#include <vector>
#include <sstream>
#include <string>
#include <iterator>
using namespace std;

int bounded_rand(int max){
	return rand()%max;
}

vector<int> quicksort(const vector<int> subarray){
	vector<int> less;
	vector<int> greater;
	vector<int> result;
	if(subarray.size() < 1){
		return subarray;
	} else {
		bool equal = true;
		for(int i=0; i < subarray.size(); ++i){
			if(subarray[i] != subarray[0]){
				equal = false;
			}
		}
		if(equal == true){
			return subarray;
		}
	}
	
	int pivot = bounded_rand(subarray.size());
	for(int i=0; i < subarray.size(); ++i){
		if(subarray[i] <= subarray[pivot]){
			less.push_back(subarray[i]);
		}else{
			greater.push_back(subarray[i]);
		}
	}
	
	vector<int> less_sorted;
	vector<int> greater_sorted;
	less_sorted = quicksort(less);
	greater_sorted = quicksort(greater);
	result.insert(result.end(), less_sorted.begin(), less_sorted.end());
	result.insert(result.end(), greater_sorted.begin(), greater_sorted.end());
	return result;
}

void initialize(vector<int>& array){
	for(int i=0; i<200; ++i){
		array.push_back( bounded_rand(200) );
	}
	
}

int main() {
	vector<int> foo;
	vector<int> bar;
	initialize(foo);

	bar = quicksort(foo);

	stringstream input;
	copy(foo.begin(), foo.end(), ostream_iterator<int>(input,", "));
	stringstream output;
	copy(bar.begin(), bar.end(), ostream_iterator<int>(output,", "));
	std::cout << "\nInput:\n";
	std::cout << input.str() <<endl;
	std::cout << "\nOutput:\n";
	std::cout << output.str() <<endl;
}
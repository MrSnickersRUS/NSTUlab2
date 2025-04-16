#include <iostream>
#include <vector>
#include <sstream>

using namespace std;

int countSequences(vector<int>& sequence) {
    if (sequence.size() < 2) {
        return 0;
    }

    int sequenceLen = 1;
    int sequenceCounter = 0;
    
    for (int i = 0; i < sequence.size() - 1; i++) {
        if (sequence[i + 1] >= sequence[i]) {
            sequenceLen++;
        }
        else if (sequenceLen > 1) {
            sequenceCounter++;
            sequenceLen = 1;
        }
        else {
            sequenceLen = 1;
        }
    }

    if (sequenceLen > 1) {
            sequenceCounter++;
    }

    return sequenceCounter;
}

int main() {
    cout << "Введите последовательность чисел через пробел" << endl;
    string inputSequence;
    getline(cin, inputSequence);
    vector<int> sequence;
    stringstream ss(inputSequence);

    int num;    
    while (ss >> num) {
        sequence.push_back(num);
    }

    cout << countSequences(sequence) << endl;
    return 0;
}
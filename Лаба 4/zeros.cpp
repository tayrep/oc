#include "zeros.h"
#include <string>
#include <algorithm>

using namespace std;

int maxConsecutiveZeros(int number) {
    if (number == 0) return 1;

    string binary = "";
    int num = number;

    unsigned int n = static_cast<unsigned int>(num);

    if (n == 0) binary = "0";

    while (n > 0) {
        binary = (n % 2 == 0 ? "0" : "1") + binary;
        n /= 2;
    }

    int maxZeros = 0;
    int currentZeros = 0;
    bool inZeroSequence = false;

    for (char c : binary) {
        if (c == '0') {
            if (!inZeroSequence) {
                inZeroSequence = true;
                currentZeros = 1;
            }
            else {
                currentZeros++;
            }
            if (currentZeros > maxZeros) {
                maxZeros = currentZeros;
            }
        }
        else {
            inZeroSequence = false;
            currentZeros = 0;
        }
    }

    return maxZeros;
}
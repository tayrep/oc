#include <iostream>
#include "zeros.h"

using namespace std;

int main() {
    int m, n;

    cin >> m >> n;

    int zeros_m = maxConsecutiveZeros(m);
    int zeros_n = maxConsecutiveZeros(n);

    int k = max(zeros_m, zeros_n);

    cout << "Число " << m << " в двоичной системе: ";
    cout << "Число " << n << " в двоичной системе: ";
    unsigned int temp_n = static_cast<unsigned int>(n);
    string bin_n = "";
    if (temp_n == 0) bin_n = "0";
    while (temp_n > 0) {
        bin_n = (temp_n % 2 == 0 ? "0" : "1") + bin_n;
        temp_n /= 2;
    }
    cout << bin_n << ", max нулей: " << zeros_n << endl;

    cout << "Максимальное количество подряд идущих нулей: k = " << k << endl;

    return 0;
}
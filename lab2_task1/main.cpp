#include <iostream>
#include <string>

using namespace std;

string checkBoardBounds(int n, int m, string steps) {
    for (int startX = 1; startX <= n; startX++) {
        for (int startY = 1; startY <= m; startY++) {
            int x = startX, y = startY;
            bool isValid = true;

            for (char step : steps) {
                switch (step) {
                    case 'L': x--; break;
                    case 'R': x++; break;
                    case 'D': y--; break;
                    case 'U': y++; break;
                    default: return "Ошибка в значении ходов";
                }

                if (x < 1 || x > n || y < 1 || y > m) {
                    isValid = false;
                    break;
                }
            }

            if (isValid) {
                return "(" + to_string(startX) + "," + to_string(startY) + ")";
            }
        }
    }
    return "No";
}

int main() {
    int n, m;
    string steps;

    cout << "Введите длину доски: ";
    cin >> n;
    cout << "Введите ширину доски: ";
    cin >> m;
    cout << "Введите ходы для фигуры (LRDU): ";
    cin >> steps;

    cout << checkBoardBounds(n, m, steps) << endl;
    return 0;
}
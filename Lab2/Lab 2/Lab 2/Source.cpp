#include <iostream>
using namespace std;

int main() {
	int x = 2;
	int y = x + 4;
	cout << "x: " << x << endl;
	cout << "y: " << y << endl;

	int temp;
	temp = x;
	x = y;
	y = x;

	cout << "x: " << x << endl;
	cout << "y: " << y << endl;

	return 0;
}
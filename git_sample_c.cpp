//Reversing A String
#include <iostream>
#include <string>
//#include <algorithm>
using namespace std;


void reverseStr(string& x)
{
	string temp = " ";
	int len = x.length();

	for(int i = len-1; i >= 0; --i)
	{
		temp += x[i];
	}
	x = temp;
}

int main()
{
	string s = "This is a sample program to upload into git from my new ubuntu";
	cout << "Original string: " << s << endl;
	
	//reverse(s.begin(), s.end());
	reverseStr(s);
	cout << "Reversed string: " << s << endl;

	return 0;
}

#include <stdio.h>
#include <Windows.h>

extern long long rozmiar(wchar_t* nazwa, FILETIME* czas);

int main(void)
{
	long long rozmiar1;
	wchar_t nazwa[] = L"plik.txt";
	HANDLE plik = NULL;
	WIN32_FIND_DATA FindFileData;
	FILETIME czas;

	rozmiar1 = rozmiar(nazwa, &czas);

	printf("%d", rozmiar1);
	/*plik = FindFirstFileW(nazwa, &FindFileData);
	if (plik != INVALID_HANDLE_VALUE)
	{
		wprintf(L"%s", FindFileData.cFileName);
		czas = FindFileData.ftCreationTime;
	}*/

	return 0;
}
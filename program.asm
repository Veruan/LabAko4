.686
.model flat

extern _FindFirstFileW@8: proc

public _rozmiar

.code
	_rozmiar proc
		push ebp
		mov ebp, esp
		sub esp, 592 ; [ebp - 592] - FILE_DATA
		push ebx
		push esi
		push edi

		; czas [ebp + 12]
		; nazwa [ebp + 8]
		lea eax, [ebp - 592]

		push dword PTR eax ; FILE_DATA_PTR
		push dword PTR [ebp + 8] ; NAZWA
		call _FindFirstFileW@8

		cmp eax, -1
		je brak_pliku

		lea ebx, [ebp - 592] ; FILE_DATA
		mov eax, [ebx + 32] ; nFileSizeHigh
		mov edx, [ebx + 28] ; nFileSizeLow

		mov ecx, [ebp + 12] ; adres czasu
		mov esi, [ebx + 4] ; ftCreationTime dwLowDateTime
		mov edi, [ebx + 8] ; ftCreationTime dwHighDateTime
		mov [ecx], esi
		mov [ecx + 4], edi
		
		jmp koniec
	

		brak_pliku:
			mov eax, -1
			jmp koniec

		koniec:
		pop edi
		pop esi
		pop ebx
		add esp, 592
		pop ebp
		ret
	_rozmiar endp

END
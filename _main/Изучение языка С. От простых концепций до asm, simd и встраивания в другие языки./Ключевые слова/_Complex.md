# _Complex

**Категория:** Тип данных (C99)

## Назначение

Тип для комплексных чисел.

## Пример

```c
#include <complex.h>

double complex z1 = 3.0 + 4.0 * I;
float complex z2 = 1.0f - 2.0f * I;

// Операции
double complex sum = z1 + z2;

// Функции
double real = creal(z1);      // 3.0
double imag = cimag(z1);      // 4.0
double abs = cabs(z1);        // 5.0
```

## Макросы

- `I` — мнимая единица
- `complex` — алиас для `_Complex`

## Источники
- [CppReference — Complex types](https://en.cppreference.com/w/c/language/arithmetic_types#Complex_types)

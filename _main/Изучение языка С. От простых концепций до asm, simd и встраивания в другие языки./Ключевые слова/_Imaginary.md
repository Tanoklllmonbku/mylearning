# _Imaginary

**Категория:** Тип данных (C99)

## Назначение

Тип для мнимых чисел (только мнимая часть).

## Пример

```c
#include <complex.h>

double _Imaginary z1 = 4.0 * I;

// Использование с комплексными
double complex c = 3.0 + z1;  // 3.0 + 4.0i
```

## Особенности

- Поддерживается не всеми компиляторами
- GCC: отключено по умолчанию

## Источники
- [CppReference — Complex types](https://en.cppreference.com/w/c/language/arithmetic_types#Complex_types)

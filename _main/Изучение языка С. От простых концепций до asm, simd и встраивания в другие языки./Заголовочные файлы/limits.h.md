# limits.h

**Назначение:** Пределы целочисленных типов.

## Целочисленные типы

```c
// char
CHAR_BIT   // бит в байте (8)
CHAR_MIN   // минимум char
CHAR_MAX   // максимум char
SCHAR_MIN  // минимум signed char (-128)
SCHAR_MAX  // максимум signed char (127)
UCHAR_MAX  // максимум unsigned char (255)

// short
SHRT_MIN   // минимум short
SHRT_MAX   // максимум short
USHRT_MAX  // максимум unsigned short

// int
INT_MIN    // минимум int
INT_MAX    // максимум int
UINT_MAX   // максимум unsigned int

// long
LONG_MIN   // минимум long
LONG_MAX   // максимум long
ULONG_MAX  // максимум unsigned long

// long long
LLONG_MIN  // минимум long long
LLONG_MAX  // максимум long long
ULLONG_MAX // максимум unsigned long long
```

## Примеры значений (x86-64)

```c
#include <limits.h>
#include <stdio.h>

int main() {
    printf("CHAR_BIT: %d\n", CHAR_BIT);      // 8
    printf("CHAR_MAX: %d\n", CHAR_MAX);      // 127
    printf("INT_MAX: %d\n", INT_MAX);        // 2147483647
    printf("INT_MIN: %d\n", INT_MIN);        // -2147483648
    printf("UINT_MAX: %u\n", UINT_MAX);      // 4294967295
    printf("LONG_MAX: %ld\n", LONG_MAX);     // 9223372036854775807
    printf("LLONG_MAX: %lld\n", LLONG_MAX);  // 9223372036854775807
    
    return 0;
}
```

## Применение

### 1. Проверка переполнения

```c
#include <limits.h>

int safe_add(int a, int b) {
    if (b > 0 && a > INT_MAX - b) return INT_MAX;  // переполнение
    if (b < 0 && a < INT_MIN - b) return INT_MIN;  // подтекание
    return a + b;
}
```

### 2. Инициализация

```c
// Поиск минимума
int min = INT_MAX;
for (int i = 0; i < n; i++) {
    if (arr[i] < min) min = arr[i];
}

// Поиск максимума
int max = INT_MIN;
for (int i = 0; i < n; i++) {
    if (arr[i] > max) max = arr[i];
}
```

### 3. Портативный код

```c
// Вместо магических чисел
int buffer[1000000];  // ПЛОХО

int buffer[INT_MAX / sizeof(int) - 1];  // ХОРОШО
```

## Источники
- [CppReference — limits.h](https://en.cppreference.com/w/c/header/limits_h)

## См. также
- [[Заголовочные файлы C]] — оглавление раздела
- [[stdint.h]]
- [[float.h]]

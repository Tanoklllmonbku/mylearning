# stdint.h

**Назначение:** Типы фиксированной ширины (C99).

## Типы фиксированной ширины

### Знаковые

| Тип | Ширина | Диапазон |
|-----|--------|----------|
| `int8_t` | 8 бит | -128 ... 127 |
| `int16_t` | 16 бит | -32768 ... 32767 |
| `int32_t` | 32 бита | ±2×10⁹ |
| `int64_t` | 64 бита | ±9×10¹⁸ |

### Беззнаковые

| Тип | Ширина | Диапазон |
|-----|--------|----------|
| `uint8_t` | 8 бит | 0 ... 255 |
| `uint16_t` | 16 бит | 0 ... 65535 |
| `uint32_t` | 32 бита | 0 ... 4×10⁹ |
| `uint64_t` | 64 бита | 0 ... 1.8×10¹⁹ |

## Типы наименьшей ширины

```c
int_least8_t   // минимум 8 бит
int_least16_t  // минимум 16 бит
int_least32_t  // минимум 32 бита
int_least64_t  // минимум 64 бита
```

## Типы быстрейшие

```c
int_fast8_t    // быстрейший ≥8 бит
int_fast16_t   // быстрейший ≥16 бит
int_fast32_t   // быстрейший ≥32 бита
int_fast64_t   // быстрейший ≥64 бита
```

## Другие типы

```c
intptr_t       // указатель как int
uintptr_t      // указатель как unsigned
intmax_t       // максимальный знаковый
uintmax_t      // максимальный беззнаковый
```

## Предельные константы

```c
#include <stdint.h>
#include <inttypes.h>

INT8_MIN, INT8_MAX      // -128, 127
UINT8_MAX               // 255
INT32_MIN, INT32_MAX    // ±2×10⁹
UINT64_MAX              // 1.8×10¹⁹

// Форматы для printf/scanf
PRId32   // "d" для int32_t
PRIu64   // "u" для uint64_t
PRIx16   // "x" для uint16_t

printf("%" PRId32 "\n", value);
scanf("%" SCNu64, &value);
```

## Пример

```c
#include <stdint.h>
#include <stdio.h>

int main() {
    int32_t x = -1000000;
    uint64_t big = 18446744073709551615ULL;
    
    printf("%" PRId32 "\n", x);
    printf("%" PRIu64 "\n", big);
    
    return 0;
}
```

## Источники
- [CppReference — stdint.h](https://en.cppreference.com/w/c/types/stdint_h)

## См. также
- [[Заголовочные файлы C]] — оглавление раздела
- [[stddef.h]]
- [[limits.h]]

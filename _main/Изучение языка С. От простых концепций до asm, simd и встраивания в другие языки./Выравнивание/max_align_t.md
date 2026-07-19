# max_align_t

**Категория:** Тип (C11)

## Назначение

Тип с **максимальным требованием выравнивания** на платформе.

## Определение

```c
#include <stddef.h>

typedef struct {
    // содержимое реализационно-зависимое
} max_align_t;
```

## Характеристики

- Выравнивание: обычно **16 или 32 байта**
- Размер: соответствует выравниванию

## Пример

```c
#include <stdio.h>
#include <stddef.h>

printf("sizeof(max_align_t): %zu\n", sizeof(max_align_t));
printf("alignof(max_align_t): %zu\n", alignof(max_align_t));

// Вывод на x86-64:
// sizeof(max_align_t): 16
// alignof(max_align_t): 16
```

## Применение

### 1. Выравнивание по максимуму

```c
_Alignas(max_align_t) char buffer[4096];
```

### 2. Собственные аллокаторы

```c
struct Block {
    max_align_t header;  // максимальное выравнивание
    size_t size;
    char data[];
};
```

### 3. Портативный код

```c
// Гарантированно работает на любой платформе
typedef union {
    max_align_t align;
    char data[SIZE];
} AlignedBuffer;
```

## Источники
- [CppReference — max_align_t](https://en.cppreference.com/w/c/types/max_align_t)

# aligned_alloc

**Категория:** Функция выделения памяти (C11)

## Назначение

Выделение выровненной памяти в куче.

## Синтаксис

```c
#include <stdlib.h>

void* aligned_alloc(size_t alignment, size_t size);
```

## Параметры

- `alignment` — выравнивание (степень двойки)
- `size` — размер в байтах (должен быть кратен `alignment`)

## Возвращает

- Указатель на выровненную память
- `NULL` при ошибке

## Пример

```c
#include <stdlib.h>
#include <stdio.h>

// Выделение 1024 байт с выравниванием 64
void* ptr = aligned_alloc(64, 1024);

if (ptr) {
    printf("Address: %p\n", ptr);
    // Проверка выравнивания
    printf("Aligned: %s\n", 
           ((size_t)ptr % 64 == 0) ? "yes" : "no");
    
    free(ptr);  // освобождение как обычно
}
```

## Применение

- SIMD буферы (SSE, AVX)
- DMA трансферы
- Атомарные типы
- Кэш-линии

## Сравнение с malloc

```c
void* p1 = malloc(1024);        // выравнивание ~16
void* p2 = aligned_alloc(64, 1024);  // выравнивание 64
```

## Источники
- [CppReference — aligned_alloc](https://en.cppreference.com/w/c/memory/aligned_alloc)

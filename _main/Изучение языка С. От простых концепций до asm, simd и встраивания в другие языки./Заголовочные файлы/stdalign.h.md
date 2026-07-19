# stdalign.h

**Назначение:** Выравнивание (C11).

## Макросы

```c
alignas    // раскрывается как _Alignas
alignof    // раскрывается как _Alignof
__alignas_is_defined  // 1 если alignas определён
__alignof_is_defined  // 1 если alignof определён
```

## Примеры

### alignas

```c
#include <stdalign.h>
#include <stdio.h>

// Выравнивание константой
alignas(16) int x;

// Выравнивание типом
alignas(double) char buf[100];

// В структуре
struct alignas(64) CacheLine {
    int data[16];
};

// Проверка
printf("%zu\n", alignof(x));  // 16
```

### alignof

```c
#include <stdalign.h>
#include <stdio.h>

int main() {
    printf("%zu\n", alignof(char));    // 1
    printf("%zu\n", alignof(int));     // 4
    printf("%zu\n", alignof(double));  // 8
    
    struct S { char c; int i; };
    printf("%zu\n", alignof(struct S));  // 4
    
    return 0;
}
```

## Применение

### 1. SIMD данные

```c
#include <stdalign.h>
#include <xmmintrin.h>  // SSE

alignas(16) __m128 vec1, vec2;
alignas(32) __m256 vec_avx;
```

### 2. Выровненная память

```c
#include <stdalign.h>
#include <stdlib.h>

alignas(max_align_t) char buffer[4096];
```

### 3. Атомарные типы

```c
#include <stdalign.h>
#include <stdatomic.h>

alignas(atomic_long) char storage[sizeof(atomic_long)];
atomic_long* ptr = (atomic_long*)storage;
```

## C23

В C23 `alignas` и `alignof` становятся ключевыми словами.

## Источники
- [CppReference — stdalign.h](https://en.cppreference.com/w/c/header/stdalign_h)

## См. также
- [[Заголовочные файлы C]] — оглавление раздела
- [[Выравнивание в C]]
- [[_main/Изучение языка С. От простых концепций до asm, simd и встраивания в другие языки./Ключевые слова/_Alignas]]
- [[_main/Изучение языка С. От простых концепций до asm, simd и встраивания в другие языки./Ключевые слова/_Alignof]]

# _Alignof

**Категория:** Оператор (C11)

## Назначение

Получение требования выравнивания типа.

## Синтаксис

```c
_Alignof(тип)
```

Возвращает `size_t` — выравнивание в байтах.

## Пример

```c
#include <stdio.h>
#include <stdalign.h>

int main() {
    printf("char: %zu\n", alignof(char));        // 1
    printf("short: %zu\n", alignof(short));      // 2
    printf("int: %zu\n", alignof(int));          // 4
    printf("double: %zu\n", alignof(double));    // 8
    printf("void*: %zu\n", alignof(void*));      // 8
    printf("max_align_t: %zu\n", alignof(max_align_t)); // 16 или 32
    
    // Для структур
    struct S { char c; int i; };
    printf("struct S: %zu\n", alignof(struct S)); // 4
}
```

## Отличие от sizeof

- `sizeof` — **размер** в байтах
- `_Alignof` — **выравнивание** в байтах

```c
sizeof(double)   // 8 (размер)
alignof(double)  // 8 (выравнивание)

sizeof(struct { char c; int i; })   // 8 (с padding)
alignof(struct { char c; int i; })  // 4 (по int)
```
## См. так же
[[_main/Изучение языка С. От простых концепций до asm, simd и встраивания в другие языки./Ключевые слова/_Alignof|_Alignof]]
## Источники
- [CppReference — _Alignof](https://en.cppreference.com/w/c/language/_Alignof)

# stdbool.h

**Назначение:** Булев тип (C99).

## Макросы

```c
bool    // _Bool
true    // 1
false   // 0
__bool_true_false_are_defined  // флаг определения
```

## Пример использования

```c
#include <stdbool.h>
#include <stdio.h>

bool is_even(int x) {
    return x % 2 == 0;
}

int main() {
    bool flag = true;
    bool done = false;
    
    if (flag) {
        printf("Flag is set\n");
    }
    
    if (is_even(42)) {
        printf("42 is even\n");
    }
    
    // Булевы операции
    bool a = true, b = false;
    printf("%d\n", a && b);  // 0
    printf("%d\n", a || b);  // 1
    printf("%d\n", !a);      // 0
    
    // Приведение
    int x = 5;
    bool b2 = x;  // true (любое ненулевое)
    
    printf("%d\n", b2);  // 1
    
    return 0;
}
```

## Особенности

- `bool` — макрос для `_Bool`
- `true` и `false` — макросы для 1 и 0
- При присваивании любое ненулевое становится `true` (1)

## Без stdbool.h

```c
// C89 стиль
typedef enum { false = 0, true = 1 } bool;

// Или просто
#define bool int
#define true 1
#define false 0
```

## C23

В C23 `bool`, `true`, `false` становятся ключевыми словами, а не макросами.

## Источники
- [CppReference — stdbool.h](https://en.cppreference.com/w/c/header/stdbool_h)

## См. также
- [[Заголовочные файлы C]] — оглавление раздела
- [[_Bool]]

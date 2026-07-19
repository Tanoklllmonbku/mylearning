# _Bool

**Категория:** Тип данных (C99)

## Назначение

Встроенный булев тип. Хранит значения `0` (ложь) и `1` (истина).

## Пример

```c
_Bool flag = 1;
_Bool is_valid = 0;

// Любое ненулевое значение становится 1
_Bool b = 5;  // b == 1
```

## stdbool.h

```c
#include <stdbool.h>

bool flag = true;   // _Bool
bool done = false;
```

## Источники
- [CppReference — _Bool](https://en.cppreference.com/w/c/language/_Bool)

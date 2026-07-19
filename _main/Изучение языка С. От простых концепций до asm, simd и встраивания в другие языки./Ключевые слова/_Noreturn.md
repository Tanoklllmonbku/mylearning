# _Noreturn

**Категория:** Спецификатор функции (C11)

## Назначение

Указание, что функция **никогда не возвращает** управление.

## Пример

```c
#include <stdnoreturn.h>
#include <stdio.h>
#include <stdlib.h>

noreturn void fatal_error(const char* msg) {
    fprintf(stderr, "FATAL: %s\n", msg);
    exit(1);
}

noreturn void infinite_loop() {
    while (1) { }
}
```

## Применение

- Функции обработки фатальных ошибок
- Бесконечные циклы

## Источники
- [CppReference — _Noreturn](https://en.cppreference.com/w/c/language/_Noreturn)

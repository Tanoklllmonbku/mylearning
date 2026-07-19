# Include guards

**Include guards** — защита от повторного включения заголовочного файла.

## Проблема

```c
// header.h
struct Data { int x; };

// main.c
#include "header.h"
#include "other.h"  // который включает header.h
// ОШИБКА: повторное определение struct Data!
```

## Решение

```c
// header.h
#ifndef HEADER_H
#define HEADER_H

struct Data { int x; };

#endif
```

## Как работает

1. Первый `#include`: `HEADER_H` не определён → определяется → содержимое включается
2. Второй `#include`: `HEADER_H` уже определён → содержимое пропускается

## Формы

### Классическая

```c
#ifndef MY_HEADER_H
#define MY_HEADER_H

// содержимое

#endif
```

### С префиксом проекта

```c
#ifndef MYPROJECT_MODULE_HEADER_H
#define MYPROJECT_MODULE_HEADER_H

#endif
```

### #pragma once (альтернатива)

```c
#pragma once

// содержимое
```

**Преимущества:**
- Короче
- Быстрее (не проверяется препроцессором)

**Недостатки:**
- Нестандартная (хотя поддерживается везде)
- Проблемы с symlink

## Пример из практики

Include guards в [[Калькулятор]]:

```c
// calculator.h
#ifndef CALCULATOR_H
#define CALCULATOR_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
// ...

#endif
```

```c
// sum.h
#ifndef SUM_H
#define SUM_H
#include <stdio.h>
int __SUM(int a, int b);
#endif
```

```c
// div.h
#ifndef DIV_H
#define DIV_H
#include <stdio.h>
int __DIV(int a, int b);
#endif
```

Все заголовочные файлы проекта используют include guards для защиты от повторного включения.

## Источники
- [CppReference — #include](https://en.cppreference.com/w/c/preprocessor/include)

## См. также
- [[Заголовочные файлы C]] — оглавление раздела
- [[Структура заголовка]]
- [[if_ifdef_ifndef]]
- [[Калькулятор]] — пример использования в проекте

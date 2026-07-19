# Include guards

**Include guards** (защита от повторного включения) — паттерн предотвращения дублирования содержимого заголовочных файлов.

## Проблема

```c
// header.h
struct Data { int x; };

// main.c
#include "header.h"
#include "header.h"  // ошибка: повторное определение!
```

## Решение: #ifndef

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

### С уникальным суффиксом

```c
#ifndef HEADER_H_A1B2C3D4
#define HEADER_H_A1B2C3D4

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

## Пример сложного guard

```c
// complex.h
#ifndef MYLIB_COMPLEX_H
#define MYLIB_COMPLEX_H

#include <math.h>

typedef struct {
    double real;
    double imag;
} complex_t;

// ...

#endif /* MYLIB_COMPLEX_H */
```

## Источники
- [CppReference — #include](https://en.cppreference.com/w/c/preprocessor/include)

## См. также
- [[Препроцессор C]] — оглавление раздела
- [[include]]
- [[if_ifdef_ifndef]]

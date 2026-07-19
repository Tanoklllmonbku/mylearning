# stdarg.h

**Назначение:** Обработка вариадических аргументов.

## Макросы

```c
va_list      // тип для списка аргументов
va_start     // инициализация
va_arg       // получение аргумента
va_copy      // копирование (C99)
va_end       // завершение
```

## Синтаксис

```c
#include <stdarg.h>

void function(int fixed_args, ...) {
    va_list args;
    va_start(args, fixed_args);
    
    // получение аргументов
    type arg = va_arg(args, type);
    
    va_end(args);
}
```

## Примеры

### 1. Сумма чисел

```c
#include <stdarg.h>
#include <stdio.h>

int sum(int count, ...) {
    va_list args;
    va_start(args, count);
    
    int total = 0;
    for (int i = 0; i < count; i++) {
        total += va_arg(args, int);
    }
    
    va_end(args);
    return total;
}

int main() {
    printf("%d\n", sum(3, 1, 2, 3));      // 6
    printf("%d\n", sum(5, 10, 20, 30, 40, 50));  // 150
    return 0;
}
```

### 2. Форматированная строка

```c
#include <stdarg.h>
#include <stdio.h>

void log_message(const char* format, ...) {
    va_list args;
    va_start(args, format);
    
    vprintf(format, args);  // v-функции используют va_list
    
    va_end(args);
}

int main() {
    log_message("Value: %d\n", 42);
    log_message("Name: %s, Age: %d\n", "Alice", 30);
    return 0;
}
```

### 3. Поиск максимума

```c
#include <stdarg.h>
#include <limits.h>

int max(int count, ...) {
    va_list args;
    va_start(args, count);
    
    int maximum = INT_MIN;
    for (int i = 0; i < count; i++) {
        int val = va_arg(args, int);
        if (val > maximum) maximum = val;
    }
    
    va_end(args);
    return maximum;
}
```

## v-функции

```c
int printf(const char* fmt, ...);
int vprintf(const char* fmt, va_list args);

int fprintf(FILE* stream, const char* fmt, ...);
int vfprintf(FILE* stream, const char* fmt, va_list args);

int sprintf(char* str, const char* fmt, ...);
int vsprintf(char* str, const char* fmt, va_list args);

int snprintf(char* str, size_t n, const char* fmt, ...);
int vsnprintf(char* str, size_t n, const char* fmt, va_list args);
```

## Важные правила

1. **Обязательно** знать количество/тип аргументов
2. Последний именованный аргумент передаётся в `va_start`
3. `va_end` должен вызываться всегда
4. Нельзя смешивать типы без маркера

## Источники
- [CppReference — stdarg.h](https://en.cppreference.com/w/c/header/stdarg_h)

## См. также
- [[Заголовочные файлы C]] — оглавление раздела
- [[stdio.h]]

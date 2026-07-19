# __func__

**Категория:** Предопределённый идентификатор (C99)

## Назначение

Имя текущей функции как строковый литерал.

## Объявление

В каждой функции неявно объявлено:

```c
static const char __func__[] = "имя_функции";
```

## Пример

```c
#include <stdio.h>

void my_function() {
    printf("In function: %s\n", __func__);
}

int main() {
    printf("In function: %s\n", __func__);  // "main"
    my_function();  // "my_function"
}
```

## Применение

### 1. Логирование

```c
#define LOG_ENTER() \
    printf("-> %s\n", __func__)

#define LOG_EXIT() \
    printf("<- %s\n", __func__)

void process() {
    LOG_ENTER();
    // ... код ...
    LOG_EXIT();
}
```

### 2. Отладка

```c
#define DEBUG_TRACE() \
    fprintf(stderr, "TRACE: %s:%d in %s\n", \
            __FILE__, __LINE__, __func__)

void risky_operation() {
    DEBUG_TRACE();
    // ... код ...
}
```

### 3. Сообщения об ошибках

```c
#define CHECK(ptr) \
    if (!(ptr)) { \
        fprintf(stderr, \
            "NULL pointer in %s (%s:%d)\n", \
            __func__, __FILE__, __LINE__); \
        abort(); \
    }
```

## Отличия от других макросов

| Макрос | Тип | Значение |
|--------|-----|----------|
| `__func__` | `const char[]` | Имя функции |
| `__FUNCTION__` | `const char[]` | Расширение GCC |
| `__PRETTY_FUNCTION__` | `const char[]` | Полная сигнатура (GCC) |

## Пример с GCC

```c
void example(int x, char* s) {
    printf("%s\n", __func__);           // "example"
    printf("%s\n", __FUNCTION__);       // "example"
    printf("%s\n", __PRETTY_FUNCTION__); // "void example(int, char*)"
}
```

## Источники
- [CppReference — __func__](https://en.cppreference.com/w/c/language/__func__)

## См. также
- [[Препроцессор C]] — оглавление раздела
- [[__LINE__ __FILE__]]

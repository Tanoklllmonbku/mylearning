# Оператор # (stringify)

**Категория:** Оператор препроцессора

## Назначение

Преобразует аргумент макроса в строковый литерал.

## Синтаксис

```c
#define MACRO(x) #x
```

## Пример

```c
#define STRINGIFY(x) #x
#define TOSTRING(x) STRINGIFY(x)

// Преобразование в строку
const char* s = STRINGIFY(hello);      // "hello"
const char* n = STRINGIFY(123);        // "123"
const char* op = STRINGIFY(a + b);     // "a + b"

// С макросом
#define VALUE 42
const char* v = STRINGIFY(VALUE);      // "VALUE", а не "42"
const char* v2 = TOSTRING(VALUE);      // "42"
```

## Двойное преобразование

Для раскрытия макроса перед stringify нужно два уровня:

```c
#define LEVEL1(x) #x
#define LEVEL2(x) LEVEL1(x)

#define MACRO hello

LEVEL1(MACRO)  // "MACRO" (не раскрыто)
LEVEL2(MACRO)  // "hello" (раскрыто и строка)
```

## Применение

### 1. Отладочные макросы

```c
#define DEBUG_PRINT(var) \
    printf(#var " = %d\n", var)

int x = 42;
DEBUG_PRINT(x);  // printf("x = %d\n", x);
```

### 2. Генерация кода

```c
#define REGISTER_HANDLER(name) \
    void handle_##name(); \
    const char* name##_str = #name;

REGISTER_HANDLER(connect)
// void handle_connect();
// const char* connect_str = "connect";
```

### 3. Сообщения об ошибках

```c
#define ASSERT(expr) \
    if (!(expr)) { \
        fprintf(stderr, "Assertion failed: " #expr "\n"); \
        abort(); \
    }

ASSERT(x > 0);  // "Assertion failed: x > 0"
```

## Особенности

- Пробелы вокруг токенов сохраняются
- Кавычки в аргументе экранируются
- Комментарии удаляются до stringify

## Источники
- [CppReference — Stringification](https://en.cppreference.com/w/c/preprocessor/replace)

## См. также
- [[Препроцессор C]] — оглавление раздела
- [[Оператор token pasting]]
- [[define]]

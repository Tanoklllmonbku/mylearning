# __LINE__, __FILE__, __DATE__, __TIME__

**Категория:** Стандартные макросы препроцессора

## __LINE__

Номер текущей строки в файле.

```c
printf("Error at line %d\n", __LINE__);
// После #line меняется
```

## __FILE__

Имя текущего файла компиляции.

```c
printf("Compiling %s\n", __FILE__);
// После #include — имя включённого файла
// После #line — новое имя
```

## __DATE__

Дата компиляции в формате `"MMM DD YYYY"`.

```c
printf("Compiled on %s\n", __DATE__);
// Пример: "Mar 08 2026"
```

## __TIME__

Время компиляции в формате `"HH:MM:SS"`.

```c
printf("Compiled at %s\n", __TIME__);
// Пример: "14:30:45"
```

## Примеры использования

### 1. Логирование

```c
#define LOG(msg) \
    printf("[%s:%d] %s\n", __FILE__, __LINE__, msg)

LOG("Starting...");  // [main.c:10] Starting...
```

### 2. Версия сборки

```c
const char* build_info = 
    "Build: " __DATE__ " " __TIME__;
```

### 3. Assert с информацией

```c
#define ASSERT(expr) \
    if (!(expr)) { \
        fprintf(stderr, \
            "Assertion failed: %s\n" \
            "  File: %s, Line: %d\n" \
            "  Time: %s %s\n", \
            #expr, __FILE__, __LINE__, \
            __DATE__, __TIME__); \
        abort(); \
    }
```

### 4. Уникальные имена

```c
#define UNIQUE_NAME(base) base##__LINE__
int UNIQUE_NAME(temp);  // int temp__42;
```

## Другие стандартные макросы

| Макрос | Значение |
|--------|----------|
| `__STDC__` | 1 для стандартного C |
| `__STDC_VERSION__` | Версия стандарта (201112L для C11) |
| `__STDC_HOSTED__` | 1 для hosted-среды |
| `__func__` | Имя текущей функции (C99) |

## Источники
- [CppReference — Predefined macros](https://en.cppreference.com/w/c/preprocessor/replace)

## См. также
- [[Препроцессор C]] — оглавление раздела
- [[__func__]]
- [[line]]

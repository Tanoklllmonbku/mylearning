# #if, #ifdef, #ifndef, #else, #elif, #endif

**Категория:** Директивы условной компиляции

## Назначение

Включение/исключение кода в зависимости от условий.

## Синтаксис

```c
#if условие
    // код
#elif другое_условие
    // код
#else
    // код
#endif

#ifdef имя
    // код, если имя определено
#endif

#ifndef имя
    // код, если имя НЕ определено
#endif
```

## Примеры

### #ifdef / #ifndef

```c
#define DEBUG

#ifdef DEBUG
    printf("Debug mode\n");
#endif

#ifndef RELEASE
    printf("Not release build\n");
#endif
```

### #if с выражениями

```c
#define VERSION 2

#if VERSION == 1
    printf("v1");
#elif VERSION == 2
    printf("v2");  // выполнится
#else
    printf("other");
#endif
```

### Проверка макроса в выражении

```c
#if defined(DEBUG) && !defined(NDEBUG)
    // отладочный код
#endif
```

## Применение

### 1. Include guards

```c
// header.h
#ifndef HEADER_H
#define HEADER_H

// содержимое

#endif
```

### 2. Платформенный код

```c
#ifdef _WIN32
    #include <windows.h>
#elif defined(__linux__)
    #include <unistd.h>
#elif defined(__APPLE__)
    #include <TargetConditionals.h>
#endif
```

### 3. Отладка

```c
#ifdef DEBUG
    #define LOG(x) printf("LOG: %s\n", x)
#else
    #define LOG(x)
#endif
```

### 4. Версионирование

```c
#define LIB_VERSION_MAJOR 1
#define LIB_VERSION_MINOR 5

#if LIB_VERSION_MAJOR >= 2
    // новый API
#else
    // старый API
#endif
```

## Оператор defined

```c
#if defined(MACRO)
#if defined(MACRO) && defined(OTHER)
#if !defined(DISABLE_FEATURE)
```

## См. также
- [[Препроцессор C]] — оглавление раздела
- [[Условная компиляция]]
- [[_main/Изучение языка С. От простых концепций до asm, simd и встраивания в другие языки./Препроцессор/Include guards]]

## Источники
- [CppReference — Conditional inclusion](https://en.cppreference.com/w/c/preprocessor/conditional)

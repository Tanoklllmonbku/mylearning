# typedef

**Категория:** Объявление типа

## Назначение

Создание псевдонима для существующего типа.

## Синтаксис

```c
typedef существующий_тип новый_имя;
```

## Пример

```c
typedef unsigned long ulong;
typedef char* String;

typedef struct {
    int x;
    int y;
} Point;

Point p = {10, 20};

typedef int (*CompareFunc)(const void*, const void*);
```

## Пример из практики

`typedef` в [[Калькулятор]] (`calculator.h`):

```c
typedef struct {
    char sum;
    char min;
    char div;
    char mult;
} _CHAR_OPS;

// Использование в коде
_CHAR_OPS char_ops;
```

## Источники
- [CppReference — typedef](https://en.cppreference.com/w/c/language/typedef)

## См. также
- [[struct]] — структуры
- [[enum]] — перечисления
- [[Калькулятор]] — практический пример

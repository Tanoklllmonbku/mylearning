# _Generic

**Категория:** Оператор (C11)

## Назначение

Выбор выражения на основе типа аргумента (полиморфизм в C).

## Синтаксис

```c
_Generic(выражение,
    тип1: выражение1,
    тип2: выражение2,
    default: выражение по умолчанию
)
```

## Пример

```c
// Универсальный макрос abs
#define abs(x) _Generic((x), \
    int: abs_int, \
    long: abs_long, \
    double: fabs \
)(x)

int abs_int(int x) { return x < 0 ? -x : x; }
long abs_long(long x) { return x < 0 ? -x : x; }

abs(5);      // abs_int
abs(5L);     // abs_long
abs(3.14);   // fabs
```

## Источники
- [CppReference — _Generic](https://en.cppreference.com/w/c/language/generic_selection)

# enum

**Категория:** Тип данных

## Назначение

Перечисление — именованный набор целочисленных констант.

## Пример

```c
enum Color {
    RED,      // 0
    GREEN,    // 1
    BLUE      // 2
};

enum Color c = RED;

// С явными значениями
enum Status {
    OK = 0,
    ERROR = -1,
    PENDING = 100
};
```

## Источники
- [CppReference — enum](https://en.cppreference.com/w/c/language/enum)

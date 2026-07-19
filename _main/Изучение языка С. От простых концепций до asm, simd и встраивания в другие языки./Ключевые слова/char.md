# char

**Категория:** Тип данных

## Назначение

Символьный тип для хранения одного символа. Занимает **1 байт**.

## Варианты

| Тип | Размер | Диапазон |
|-----|--------|----------|
| `char` | 1 байт | зависит от платформы |
| `signed char` | 1 байт | -128 ... 127 |
| `unsigned char` | 1 байт | 0 ... 255 |

## Пример

```c
char c = 'A';           // символ
char d = 65;            // тот же символ (ASCII)
char str[] = "hello";   // строка (массив char)
```

## Источники
- [CppReference — Arithmetic types](https://en.cppreference.com/w/c/language/arithmetic_types)

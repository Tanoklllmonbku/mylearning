# unsigned

**Категория:** Модификатор типа

## Назначение

Тип только для **неотрицательных** значений.

## Пример

```c
unsigned int x = 100;
unsigned y = 200;
unsigned long z = 1000UL;

// Литералы
unsigned a = 42U;
```

## Диапазоны

| Тип | Диапазон |
|-----|----------|
| `unsigned char` | 0 ... 255 |
| `unsigned int` | 0 ... 4294967295 |

## Предостережение

```c
unsigned x = 5;
x - 10;  // НЕ -5, а большое положительное!
```

## Источники
- [CppReference — Arithmetic types](https://en.cppreference.com/w/c/language/arithmetic_types)

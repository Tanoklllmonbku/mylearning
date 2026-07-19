# long

**Категория:** Модификатор типа

## Назначение

Увеличивает размер целочисленного или вещественного типа.

## Варианты

| Тип | Размер (типично) |
|-----|-----------------|
| `long int` | 4-8 байт |
| `long long int` | 8 байт |
| `long double` | 10-16 байт |

## Пример

```c
long int big = 1000000000L;
long long int huge = 1LL << 60;
long double pi = 3.14159265358979L;
```

## Источники
- [CppReference — Arithmetic types](https://en.cppreference.com/w/c/language/arithmetic_types)

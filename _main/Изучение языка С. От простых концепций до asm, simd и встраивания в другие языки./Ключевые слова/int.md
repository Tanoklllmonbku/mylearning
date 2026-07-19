# int

**Категория:** Тип данных

## Назначение

Целочисленный тип.

## Характеристики

| Параметр | Значение (типично) |
|----------|-------------------|
| Размер | 4 байта (32 бита) |
| Диапазон (signed) | -2³¹ ... 2³¹-1 |

## Пример

```c
int x = 42;
unsigned int u = 100;
long int li = 1000000L;
long long int lli = 1LL << 60;
```

## Пример из практики

Возврат значения из `main()` в [[Hello World]]:

```c
int main() {
    printf("Hello, World!\n");
    return 0;  // int возвращает 0 при успехе
}
```

## Источники
- [CppReference — Arithmetic types](https://en.cppreference.com/w/c/language/arithmetic_types)

## См. также
- [[return]] — возврат значения
- [[Hello World]] — практический пример

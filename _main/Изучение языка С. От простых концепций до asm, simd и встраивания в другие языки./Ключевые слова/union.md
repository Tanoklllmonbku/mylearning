# union

**Категория:** Тип данных

## Назначение

Объединение — все члены занимают **одну область памяти**.

## Пример

```c
union Data {
    int i;
    float f;
    char str[20];
};

union Data d;
d.i = 42;        // записали int
d.f = 3.14f;     // перезаписали float

printf("%zu", sizeof(union Data));  // 20 (наибольший член)
```

## Применение

- Экономия памяти
- Интерпретация данных (портирование)

## Отличие от struct

- `struct` — каждый член имеет **свою память**
- `union` — все члены делят **одну память**

## Источники
- [CppReference — union](https://en.cppreference.com/w/c/language/union)

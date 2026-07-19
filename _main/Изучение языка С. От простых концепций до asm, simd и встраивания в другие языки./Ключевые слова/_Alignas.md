# _Alignas

**Категория:** Спецификатор (C11)

## Назначение

Запрос выравнивания объекта или типа в памяти.

## Пример

```c
_Alignas(16) int x;      // выровнен по 16 байт
_Alignas(max_align_t) char buf[100];

// С struct
struct _Alignas(64) CacheLine {
    int data[16];
};
```

## Применение

- SIMD (SSE, AVX требуют выравнивания)
- Атомарные операции
- Взаимодействие с железом

## См. также
- [[Выравнивание в C]] — подробный раздел о выравнивании

## Источники
- [CppReference — _Alignas](https://en.cppreference.com/w/c/language/_Alignas)

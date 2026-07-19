# signed

**Категория:** Модификатор типа

## Назначение

Явное указание на знаковый тип.

## Пример

```c
signed int x = -42;
signed char c = -128;

// По умолчанию знаковые:
int a = -1;  // то же, что signed int
```

## Важность

- `char` может быть знаковым или нет (**зависит от компилятора**)

## Источники
- [CppReference — Arithmetic types](https://en.cppreference.com/w/c/language/arithmetic_types)

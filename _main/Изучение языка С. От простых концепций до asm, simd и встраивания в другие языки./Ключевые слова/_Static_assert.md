# _Static_assert

**Категория:** Утверждение (C11)

## Назначение

Проверка условия на этапе **компиляции**.

## Синтаксис

```c
_Static_assert(условие, "сообщение");
```

## Пример

```c
// Проверка размера типа
_Static_assert(sizeof(int) == 4, "int must be 4 bytes");

// Проверка выравнивания
_Static_assert(_Alignof(double) >= 8, "double alignment");

// В структуре
struct Packet {
    _Static_assert(sizeof(int) == 4, "wrong int size");
    uint32_t header;
    char data[];
};
```

## Применение

- Проверка предположений о типах
- Валидация платформенных требований

## Источники
- [CppReference — _Static_assert](https://en.cppreference.com/w/c/language/_Static_assert)

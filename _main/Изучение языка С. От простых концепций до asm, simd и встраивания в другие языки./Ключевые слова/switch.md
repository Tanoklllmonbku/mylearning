# switch

**Категория:** Управление потоком

## Назначение

Множественный выбор ветви выполнения.

## Синтаксис

```c
switch (выражение) {
    case константа1:
        // код
        break;
    default:
        // код по умолчанию
}
```

## Пример

```c
switch (day) {
    case 1:
        printf("Monday");
        break;
    case 2:
        printf("Tuesday");
        break;
    default:
        printf("Weekend");
}
```

## Правила

- Выражение должно быть **целочисленного типа**
- `case` — только **константные выражения**
- `break` предотвращает fall-through

## Источники
- [CppReference — switch](https://en.cppreference.com/w/c/language/switch)

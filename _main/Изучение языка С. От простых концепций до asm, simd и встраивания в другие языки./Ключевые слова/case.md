# case

**Категория:** Управление потоком

## Назначение

Метка для выбора ветви в операторе `switch`. Значение должно быть **константным выражением**.

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

- Значения `case` должны быть уникальны в пределах `switch`
- Тип значения должен совпадать с типом выражения в `switch`
- `default` — необязательная ветка «по умолчанию»

## Источники
- [CppReference — switch](https://en.cppreference.com/w/c/language/switch)

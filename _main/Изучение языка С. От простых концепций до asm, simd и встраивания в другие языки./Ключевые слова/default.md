# default

**Категория:** Управление потоком

## Назначение

Метка ветки «по умолчанию» в операторе `switch`. Выполняется, если ни один `case` не подошёл.

## Пример

```c
switch (grade) {
    case 'A':
        printf("Excellent");
        break;
    case 'B':
        printf("Good");
        break;
    default:
        printf("Invalid grade");
}
```

## Правила

- `default` — **необязательный**
- Может находиться в любом месте `switch`

## Источники
- [CppReference — switch](https://en.cppreference.com/w/c/language/switch)

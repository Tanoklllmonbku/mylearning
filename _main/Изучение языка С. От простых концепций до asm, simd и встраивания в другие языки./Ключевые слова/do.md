# do

**Категория:** Управление потоком

## Назначение

Цикл с **постусловием** — тело выполняется хотя бы один раз перед проверкой условия.

## Синтаксис

```c
do {
    // тело цикла
} while (condition);
```

## Пример

```c
int x;
do {
    printf("Enter positive number: ");
    scanf("%d", &x);
} while (x <= 0);  // проверка ПОСЛЕ выполнения
```

## Отличие от while

- `while` — проверка **до** тела
- `do...while` — проверка **после** тела

## Источники
- [CppReference — do](https://en.cppreference.com/w/c/language/do)

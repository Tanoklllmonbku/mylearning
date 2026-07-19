# while

**Категория:** Управление потоком

## Назначение

Цикл с предусловием.

## Синтаксис

```c
while (condition) {
    // тело цикла
}
```

## Пример

```c
int i = 0;
while (i < 10) {
    printf("%d ", i);
    i++;
}

// Бесконечный цикл
while (1) {
    if (done) break;
}
```

## Отличие от do-while

- `while` — проверка **до** тела
- `do...while` — проверка **после** тела

## Источники
- [CppReference — while](https://en.cppreference.com/w/c/language/while)

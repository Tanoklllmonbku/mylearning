# break

**Категория:** Управление потоком

## Назначение

Немедленный выход из цикла (`for`, `while`, `do`) или `switch`.

## Пример

```c
// Выход из цикла
for (int i = 0; i < 10; i++) {
    if (i == 5) {
        break;  // выход при i == 5
    }
    printf("%d ", i);  // выведет: 0 1 2 3 4
}

// В switch
switch (x) {
    case 1:
        printf("One");
        break;  // предотвращает fall-through
    case 2:
        printf("Two");
        break;
}
```

## Источники
- [CppReference — break](https://en.cppreference.com/w/c/language/break)

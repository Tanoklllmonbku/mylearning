# register

**Категория:** Класс хранения

## Назначение

Подсказка компилятору хранить переменную в **регистре процессора**.

## Пример

```c
register int counter = 0;

for (register int i = 0; i < 1000; i++) {
    sum += array[i];
}
```

## Особенности

- **Не является обязательством** — компилятор может проигнорировать
- Нельзя взять адрес переменной (`&register_var` — ошибка)
- В современном C избыточно

## Источники
- [CppReference — Storage duration](https://en.cppreference.com/w/c/language/storage_duration)

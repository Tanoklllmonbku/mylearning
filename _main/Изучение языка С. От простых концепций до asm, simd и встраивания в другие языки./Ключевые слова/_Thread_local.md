# _Thread_local

**Категория:** Класс хранения (C11)

## Назначение

Переменная, уникальная для **каждого потока**. Вводится через заголовочный файл `threads.h`. Обеспечивает безопасный доступ к переменной между потоками. Подходит для функций, которые запускаются через единую точку и проводят разные вычисления единое кол-во раз. Так же прекрасно подходит для реализации возврата уникального кода ошибки каждым потоком без перезаписи.

## Пример

```c
#include <threads.h>

thread_local int thread_id = 0;
static thread_local char* buffer;

// В функции
void worker() {
    thread_local int calls = 0;
    calls++;
}
```

## Применение

- Глобальные переменные в многопоточном коде
- Кэш на поток (errno, buffer)
- Счётчики на поток
- Уникальные ID потоков

## errno

Стандартный пример — `errno` является `thread_local`.

## Пример из практики

Демонстрация в [[Thread Local]]:

```c
#include <threads.h>
#include <stdio.h>

thread_local int char_counter = 0;  // уникален для каждого потока

int thread_func(void *args) {
    printf("Start: %d\n", char_counter);  // каждый поток видит 0

    for (char_counter = 0; char_counter < 12; char_counter++) {
        // char_counter не пересекается между потоками
    }

    return 0;
}

int main() {
    thrd_t t1, t2;
    thrd_create(&t1, thread_func, NULL);
    thrd_create(&t2, thread_func, NULL);
    thrd_join(t1, NULL);
    thrd_join(t2, NULL);
    return 0;
}
```

**Важно:** `thread_local` защищает только саму переменную, но не данные по указателю!

```c
thread_local int counter = 0;      // ✓ Безопасно
char *shared_array = ...;          // ✗ Опасно - данные общие!
```

## Сравнение с другими классами хранения

| Класс | Область | Копий | Время жизни |
|-------|---------|-------|-------------|
| `auto` | Блок | 1 на вызов | До выхода из блока |
| `static` | Файл | 1 на программу | Вся программа |
| `thread_local` | Поток | 1 на поток | До завершения потока |
| `extern` | Программа | 1 на программу | Вся программа |

## Источники
- [CppReference — _Thread_local](https://en.cppreference.com/w/c/language/_Thread_local)

## См. также
- [[static]] — сохранение между вызовами
- [[auto]] — автоматические переменные
- [[extern]] — внешнее связывание
- [[threads.h]] — многопоточность C11
- [[Thread Local]] — практический пример с потоками
- [[C-threading. Полное руководство от начала до продвинутых концепций.]]

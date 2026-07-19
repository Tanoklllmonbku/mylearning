# Thread Local

Демонстрация работы `thread_local` в многопоточной программе из `_resources/base_level_C/thread_local/`.

## Исходный код

```c
// thread_local.c
#include <threads.h>
#include <stdio.h>

static char charset_glob[] = {'H', 'E', 'L', 'L', 'O', ' ', 'W', 'O', 'R', 'L', 'D', '!'};
thread_local int char_counter = 0;

struct ThreadData {
    char *charset;
    size_t size;
};

int thread1(void *args) {
    struct ThreadData *data = (struct ThreadData *)args;
    char *_charset = data->charset;
    size_t _size = data->size;
    
    printf("Start counting from: %d\n", char_counter);
    for (char_counter; char_counter <= _size-1; char_counter++) {
        printf("%c\n", _charset[char_counter]);
        _charset[char_counter] = 'E';
    }
    printf("%s\n", _charset);
    printf("%d\n", char_counter);
    return 0;
}

int thread2(void *args) {
    struct ThreadData *data = (struct ThreadData *)args;
    char *_charset = data->charset;
    size_t _size = data->size;
    
    printf("Start counting from: %d\n", char_counter);
    for (char_counter; char_counter <= _size-1; char_counter++) {
        printf("%c\n", _charset[char_counter]);
        _charset[char_counter] = 'D';
    }
    printf("%s\n", _charset);
    printf("%d\n", char_counter);
    return 0;
}

int main() {
    thrd_t t1, t2;
    struct ThreadData data = {
        .charset = charset_glob,
        .size = sizeof(charset_glob) / sizeof(charset_glob[0])
    };
    
    thrd_create(&t1, thread1, &data);
    thrd_create(&t2, thread2, &data);
    thrd_join(t1, NULL);
    thrd_join(t2, NULL);
    
    return 0;
}
```

## Компиляция

```bash
cd _resources/base_level_C/thread_local
gcc -std=c11 thread_local.c -o thread_local -lpthread
./thread_local
```

## Вывод (примерный)

```
Start counting from: 0
Start counting from: 0
H
H
E
E
L
L
...
```

## Объяснение

### thread_local переменная

```c
thread_local int char_counter = 0;
```

- **Каждый поток имеет свою копию** `char_counter`
- Потоки не влияют на `char_counter` друг друга
- Инициализируется один раз при первом входе потока

### Проблема в примере

```c
struct ThreadData data = {.charset = charset_glob, ...};
thrd_create(&t1, thread1, &data);  // ← ОДИН И ТОТ ЖЕ указатель!
thrd_create(&t2, thread2, &data);
```

**Проблема:** Оба потока получают указатель на **один и тот же массив** `charset_glob`.

- `thread_local` защищает только `char_counter`
- Массив `charset_glob` **общий** для всех потоков
- Потоки перезаписывают данные друг друга:
  - `thread1` записывает `'E'`
  - `thread2` записывает `'D'`

### Решение

```c
// Вариант 1: Копия данных для каждого потока
struct ThreadData {
    char *charset;
    size_t size;
};

int thread_func(void *args) {
    struct ThreadData *data = (struct ThreadData *)args;
    
    // Создаём локальную копию
    char *local_charset = malloc(data->size);
    memcpy(local_charset, data->charset, data->size);
    
    // Работаем с локальной копией
    for (int i = 0; i < data->size; i++) {
        local_charset[i] = 'X';
    }
    
    free(local_charset);
    return 0;
}

// Вариант 2: thread_local для массива
thread_local char local_buffer[100];

int thread_func(void *args) {
    // Копируем в thread_local буфер
    strcpy(local_buffer, (char*)args);
    // Работаем с local_buffer - уникален для каждого потока
}
```

## Ключевые концепции

### Thread-local storage (TLS)

| Аспект | Описание |
|--------|----------|
| **Хранение** | Отдельная копия для каждого потока |
| **Инициализация** | Один раз при первом входе потока |
| **Время жизни** | До завершения потока |
| **Производительность** | Быстрый доступ, нет гонок |

### Когда использовать thread_local

✅ **Подходит:**
- Счётчики на поток
- Буферы на поток
- `errno` — стандартный пример
- Кэш результатов на поток
- Уникальные коды ошибок на поток

❌ **Не подходит:**
- Общие данные между потоками
- Синхронизация потоков
- Передача данных между потоками

## Сравнение классов хранения

| Класс | Область | Время жизни | Пример |
|-------|---------|-------------|--------|
| `auto` | Блок | До выхода из блока | Локальные переменные |
| `static` | Файл/функция | Вся программа | Счётчик вызовов |
| `thread_local` | Поток | До завершения потока | `errno`, буферы |
| `extern` | Программа | Вся программа | Глобальные переменные |

## Практическое применение

### Thread-local errno

```c
// Каждый поток имеет свой errno
thread_local int errno = 0;

void set_error(int code) {
    errno = code;  // Не влияет на другие потоки
}
```

### Thread-local буфер

```c
thread_local char format_buffer[256];

char* format_message(const char* msg) {
    strcpy(format_buffer, msg);  // Безопасно для каждого потока
    return format_buffer;
}
```

### Thread-local ID потока

```c
thread_local int thread_id = 0;

void init_thread(int id) {
    thread_id = id;  // Уникален для каждого потока
}

void log(const char* msg) {
    printf("[Thread %d] %s\n", thread_id, msg);
}
```

## См. также
- [[Примеры кода]] — оглавление примеров
- [[_Thread_local]] — спецификатор thread_local
- [[static]] — сравнение со static
- [[threads.h]] — многопоточность C11
- [[auto]] — автоматические переменные
- [[C-threading. Полное руководство от начала до продвинутых концепций.]]

# threads.h

**Назначение:** Многопоточность (C11).

## Типы

```c
thrd_t           // поток
mtx_t            // мьютекс
cnd_t            // условие
tss_t            // специфичные данные потока
thrd_start_t     // тип функции потока
```

## Создание потоков

```c
int thrd_create(thrd_t* thr, thrd_start_t func, void* arg);
thrd_t thrd_current(void);
int thrd_equal(thrd_t lhs, thrd_t rhs);
void thrd_exit(int res);
int thrd_join(thrd_t thr, int* res);
int thrd_detach(thrd_t thr);
int thrd_sleep(const struct timespec* duration, struct timespec* remaining);
void thrd_yield(void);
```

## Мьютексы

```c
int mtx_init(mtx_t* mtx, int type);
int mtx_lock(mtx_t* mtx);
int mtx_timedlock(mtx_t* mtx, const struct timespec* ts);
int mtx_trylock(mtx_t* mtx);
int mtx_unlock(mtx_t* mtx);
void mtx_destroy(mtx_t* mtx);

// Типы мьютексов
mtx_plain       // обычный
mtx_recursive   // рекурсивный
mtx_timed       // с таймаутом
```

## Условия

```c
int cnd_init(cnd_t* cond);
int cnd_wait(cnd_t* cond, mtx_t* mtx);
int cnd_timedwait(cnd_t* cond, mtx_t* mtx, const struct timespec* ts);
int cnd_signal(cnd_t* cond);
int cnd_broadcast(cnd_t* cond);
void cnd_destroy(cnd_t* cond);
```

## Специфичные данные потока (TSS)

```c
int tss_create(tss_t* key, tss_dtor_t dtor);
void tss_delete(tss_t key);
void* tss_get(tss_t key);
int tss_set(tss_t key, void* val);
```

## Примеры

### 1. Создание потока

```c
#include <threads.h>
#include <stdio.h>

int worker(void* arg) {
    printf("Thread %d working\n", *(int*)arg);
    return 42;
}

int main() {
    thrd_t t;
    int arg = 1;
    int result;
    
    thrd_create(&t, worker, &arg);
    thrd_join(t, &result);
    
    printf("Result: %d\n", result);
    return 0;
}
```

### 2. Мьютекс

```c
#include <threads.h>

mtx_t mutex;
int shared = 0;

int increment(void* arg) {
    for (int i = 0; i < 1000; i++) {
        mtx_lock(&mutex);
        shared++;
        mtx_unlock(&mutex);
    }
    return 0;
}

int main() {
    mtx_init(&mutex, mtx_plain);
    
    thrd_t t1, t2;
    thrd_create(&t1, increment, NULL);
    thrd_create(&t2, increment, NULL);
    
    thrd_join(t1, NULL);
    thrd_join(t2, NULL);
    
    mtx_destroy(&mutex);
    return 0;
}
```

### 3. Условие (Producer-Consumer)

```c
#include <threads.h>

mtx_t mtx;
cnd_t cnd;
int ready = 0;

int producer(void* arg) {
    mtx_lock(&mtx);
    ready = 1;
    cnd_signal(&cnd);
    mtx_unlock(&mtx);
    return 0;
}

int consumer(void* arg) {
    mtx_lock(&mtx);
    while (!ready) {
        cnd_wait(&cnd, &mtx);
    }
    printf("Data ready!\n");
    mtx_unlock(&mtx);
    return 0;
}
```

## Инициализация

```c
// Статическая инициализация
thrd_t t = {0};
mtx_t m = {0};
cnd_t c = {0};

// Динамическая
thrd_create(&t, func, arg);
mtx_init(&m, mtx_plain);
cnd_init(&c);
```

## Источники
- [CppReference — threads.h](https://en.cppreference.com/w/c/header/threads_h)

## См. также
- [[Заголовочные файлы C]] — оглавление раздела
- [[stdatomic.h]]
- [[_Thread_local]]
- [[Thread Local]] — практический пример с thread_local
- [[C-threading. Полное руководство от начала до продвинутых концепций.]]
## Примеры из практики

### 1. Thread-local переменная с гонкой данных

Файл: `_resources/base_level_C/thread_local/thread_local.c`

```c
thread_local int char_counter = 0;  // У каждого потока свой счётчик

struct ThreadData {
    char *charset;
    size_t size;
};

int thread1(void *args) {
    struct ThreadData *data = (struct ThreadData *)args;
    // Проблема: charset общий для всех потоков!
    for (char_counter; char_counter <= data->size-1; char_counter++) {
        data->charset[char_counter] = 'E';  // Гонка данных!
    }
}
```

**Важно:** `thread_local` защищает только саму переменную, но не данные по указателю!

**См:** [[Thread Local]] — полный разбор и решения


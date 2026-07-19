# stdatomic.h

**Назначение:** Атомарные операции (C11).

## Типы

```c
atomic_bool
atomic_char
atomic_int
atomic_long
atomic_ptrdiff_t
atomic_size_t
atomic_uintptr_t
// и другие...

atomic_int_least32_t
atomic_int_fast32_t
atomic_intptr_t
atomic_intmax_t
```

## Макросы

```c
ATOMIC_BOOL_LOCK_FREE      // 0/1/2 — lock-free статус
ATOMIC_CHAR_LOCK_FREE
ATOMIC_INT_LOCK_FREE
// ...

ATOMIC_VAR_INIT(value)     // инициализация (устарело в C17)
atomic_init(&var, value)   // инициализация

memory_order_relaxed
memory_order_consume
memory_order_acquire
memory_order_release
memory_order_acq_rel
memory_order_seq_cst
```

## Функции

```c
// Атомарная загрузка
type atomic_load(volatile atomic_type* obj);

// Атомарное сохранение
void atomic_store(volatile atomic_type* obj, type value);

// Обмен
type atomic_exchange(volatile atomic_type* obj, type value);

// Compare-and-swap
bool atomic_compare_exchange_weak(volatile atomic_type* obj,
                                   type* expected, type desired);
bool atomic_compare_exchange_strong(...);

// Арифметика
type atomic_fetch_add(volatile atomic_type* obj, type arg);
type atomic_fetch_sub(volatile atomic_type* obj, type arg);
type atomic_fetch_and(volatile atomic_type* obj, type arg);
type atomic_fetch_or(volatile atomic_type* obj, type arg);
type atomic_fetch_xor(volatile atomic_type* obj, type arg);

// Флаги
void atomic_thread_fence(memory_order order);
void atomic_signal_fence(memory_order order);
```

## Примеры

```c
#include <stdatomic.h>
#include <stdio.h>
#include <threads.h>

atomic_int counter = 0;

int thread_func(void* arg) {
    for (int i = 0; i < 1000; i++) {
        atomic_fetch_add(&counter, 1);
    }
    return 0;
}

int main() {
    thrd_t t1, t2;
    
    thrd_create(&t1, thread_func, NULL);
    thrd_create(&t2, thread_func, NULL);
    
    thrd_join(t1, NULL);
    thrd_join(t2, NULL);
    
    printf("Counter: %d\n", atomic_load(&counter));  // 2000
    
    return 0;
}
```

## Порядки памяти

```c
// Relaxed — только атомарность
atomic_fetch_add_explicit(&counter, 1, memory_order_relaxed);

// Release — синхронизация с acquire
atomic_store_explicit(&flag, 1, memory_order_release);

// Acquire — синхронизация с release
int f = atomic_load_explicit(&flag, memory_order_acquire);

// Seq cst — строгий порядок (по умолчанию)
atomic_fetch_add(&counter, 1);  // memory_order_seq_cst
```

## Источники
- [CppReference — stdatomic.h](https://en.cppreference.com/w/c/header/stdatomic_h)

## См. также
- [[Заголовочные файлы C]] — оглавление раздела
- [[threads.h]]
- [[_Atomic]]
## Примеры из практики

### 1. Атомарное умножение (CAS-цикл)

Файл: `_resources/base_level_C/atomic/atomic.c`

```c
void atomic_multiply(atomic_int* val, int multiplier) {
    int old = atomic_load(val);
    int new_val;
    do {
        new_val = old * multiplier;
    } while (!atomic_compare_exchange_strong(val, &old, new_val));
}
```

### 2. Lock-free стек

Файл: `_resources/base_level_C/atomic/CAS_stack.c`

```c
_Atomic tagged_ptr head;  // Указатель + счётчик для защиты от ABA

void push(void* data) {
    node* new_node = create_node(data);
    tagged_ptr old = atomic_load(&head);
    tagged_ptr desired;
    
    do {
        new_node->next = old.ptr;
        desired.ptr = new_node;
        desired.counter = old.counter + 1;
    } while (!atomic_compare_exchange_weak(&head, &old, desired));
}
```

**См:** [[_Atomic]] — теория атомарных операций


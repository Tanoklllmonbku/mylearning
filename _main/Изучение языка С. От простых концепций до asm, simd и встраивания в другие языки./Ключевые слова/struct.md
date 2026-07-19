# struct

**Категория:** Тип данных

## Назначение

Структура — агрегатный тип для группировки разнотипных данных.

## Пример

```c
struct Point {
    int x;
    int y;
};

struct Point p1;
p1.x = 10;
p1.y = 20;

// Инициализация
struct Point p2 = {5, 15};
struct Point p3 = {.x = 1, .y = 2};  // именованные поля (C99)

// Указатель
struct Point* ptr = &p1;
ptr->x = 100;

// Typedef
typedef struct {
    char name[50];
    int age;
} Person;
```

## Пример из практики

Структура в [[Калькулятор]] (`calculator.h`):

```c
typedef struct {
    char sum;
    char min;
    char div;
    char mult;
} _CHAR_OPS;

// Использование
_CHAR_OPS char_ops;
char_ops.sum = '+';
char_ops.min = '-';
```

## Источники
- [CppReference — struct](https://en.cppreference.com/w/c/language/struct)

## См. также
- [[typedef]] — создание псевдонимов
- [[Выравнивание в структурах]] — выравнивание полей
- [[Калькулятор]] — практический пример
## Пример из практики: Lock-free стек с tagged pointer

Файл: `_resources/base_level_C/atomic/CAS_stack.c`

```c
typedef struct Node {
    void* data;
    struct Node* next;  // Рекурсивная ссылка
} node;

typedef struct {
    node* ptr;
    size_t counter;  // Счётчик для защиты от ABA-проблемы
} tagged_ptr;

_Atomic tagged_ptr head;  // Атомарная структура!
```

**См:** [[_Atomic]] — атомарные операции со структурами


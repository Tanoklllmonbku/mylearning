# stdlib.h

**Назначение:** Стандартная библиотека общего назначения.

## Выделение памяти

```c
void* malloc(size_t size);
void* calloc(size_t count, size_t size);
void* realloc(void* ptr, size_t new_size);
void free(void* ptr);
```

## Преобразование типов

```c
// В int
int atoi(const char* str);
long atol(const char* str);
long long atoll(const char* str);

// Вещественные
double atof(const char* str);

// Строка → число (с проверкой)
long strtol(const char* str, char** endptr, int base);
unsigned long strtoul(const char* str, char** endptr, int base);
long long strtoll(const char* str, char** endptr, int base);
double strtod(const char* str, char** endptr);
```

## Генерация случайных чисел

```c
int rand(void);              // 0 ... RAND_MAX
void srand(unsigned int seed);

// Пример
srand(time(NULL));
int r = rand() % 100;        // 0 ... 99
```

## Управление программой

```c
void exit(int status);
void abort(void);
int atexit(void (*func)(void));
int system(const char* command);
```

## Поиск и сортировка

```c
void qsort(void* base, size_t count, size_t size, 
           int (*cmp)(const void*, const void*));

void* bsearch(const void* key, const void* base, 
              size_t count, size_t size,
              int (*cmp)(const void*, const void*));
```

## Примеры

```c
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

// Сравнение для qsort
int cmp_int(const void* a, const void* b) {
    return (*(int*)a - *(int*)b);
}

int main() {
    // Выделение памяти
    int* arr = malloc(10 * sizeof(int));
    int* arr2 = calloc(10, sizeof(int));  // обнулено
    
    arr = realloc(arr, 20 * sizeof(int));
    free(arr);
    free(arr2);
    
    // Преобразование
    int x = atoi("42");
    long y = strtol("100", NULL, 10);
    
    // Сортировка
    int data[] = {5, 2, 8, 1, 9};
    qsort(data, 5, sizeof(int), cmp_int);
    
    // Выход
    exit(0);
    
    return 0;
}
```

## Источники
- [CppReference — stdlib.h](https://en.cppreference.com/w/c/header/stdlib_h)

## См. также
- [[Заголовочные файлы C]] — оглавление раздела
- [[stdio.h]]
- [[string.h]]

# void

**Категория:** Тип данных

## Назначение

Тип «ничего». Для функций без возвращаемого значения и указателей на произвольные данные.

## Применение

### 1. Функции без возврата

```c
void print_hello() {
    printf("Hello");
}
```

### 2. Указатель на void

```c
void* ptr;  // универсальный указатель

int x = 42;
ptr = &x;
int* ip = (int*)ptr;  // явное приведение
```

### 3. Пустой список параметров

```c
int func(void);  // функция без параметров
```

## Источники
- [CppReference — void](https://en.cppreference.com/w/c/language/void)
## Пример из практики: Универсальный стек

Файл: `_resources/base_level_C/stack.c`

```c
void* stack[MAX];  // Массив указателей на любые данные
int top = -1;

void push(void* data) {
    stack[++top] = data;  // Принимает любые указатели
}

void* pop() {
    return stack[top--];  // Возвращает void*
}

// Использование:
push("Hello");      // char*
push((void*)42);    // int как pointer
```



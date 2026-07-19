# extern

**Категория:** Класс хранения

## Назначение

Объявление переменной или функции, определённой **в другом месте**.

## Пример

```c
// file1.c
int global_var = 42;     // определение

// file2.c
extern int global_var;   // объявление

void func() {
    printf("%d", global_var);
}
```

## Применение

- Обмен глобальными переменными между файлами
- Объявление функций из заголовочных файлов

## Источники
- [CppReference — Storage duration](https://en.cppreference.com/w/c/language/storage_duration)
## Пример из практики: Stack на глобальных переменных

Файл: `_resources/base_level_C/stack.c`

```c
// Глобальные данные стека
void* stack[MAX];  // extern-доступ из других функций
int top = -1;

// Функции работают с глобальным состоянием
void push(void* data) { /* ... */ }
void* pop() { /* ... */ }
```

**См:** [[Примеры кода]] — полный код и компиляция


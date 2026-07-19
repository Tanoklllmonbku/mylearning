# sizeof

**Категория:** Оператор

## Назначение

Вычисление размера объекта или типа в байтах.

## Синтаксис

```c
sizeof выражение
sizeof(тип)
```

## Пример

```c
printf("%zu", sizeof(int));        // 4 (типично)
printf("%zu", sizeof(double));     // 8

int arr[10];
printf("%zu", sizeof(arr) / sizeof(arr[0]));  // 10 (элементов)
```

## Пример из практики

Использование `sizeof` для выделения памяти под буфер в [[Калькулятор]]:

```c
#define MAX_INPUT_LEN 100
#define MAX_TOKENS 99

char buffer[MAX_INPUT_LEN];  // буфер для ввода
// sizeof(buffer) == 100 байт

typedef struct {
    char sum;
    char min;
    char div;
    char mult;
} _CHAR_OPS;

// sizeof(_CHAR_OPS) == 4 байта (структура из 4 char)
```

## Источники
- [CppReference — sizeof](https://en.cppreference.com/w/c/language/sizeof)

## См. также
- [[typedef]] — определение типов
- [[struct]] — структуры
- [[define]] — макросы размеров
- [[Калькулятор]] — практический пример

# #define

**Категория:** Директива определения макроса

## Назначение

Определение именованной константы или макроса.

## Синтаксис

```c
#define имя замена
#define имя(аргументы) замена
```

## Примеры

### Константы

```c
#define MAX 100
#define PI 3.14159265359
#define MESSAGE "Hello"

int arr[MAX];
double r = PI * 2;
```

### Макросы с аргументами

```c
#define SQUARE(x) ((x) * (x))
#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int s = SQUARE(5);      // 25
int m = MAX(3, 7);      // 7
```

### Пустой макрос

```c
#define DEBUG_PRINT(x)  // отключено
#define DEBUG_PRINT(x) printf(x)  // включено
```

## Важные правила

1. **Всегда скобки** для аргументов:
   ```c
   // ПЛОХО
   #define SQUARE(x) x * x
   SQUARE(1 + 2)  // 1 + 2 * 1 + 2 = 5, а не 9!

   // ХОРОШО
   #define SQUARE(x) ((x) * (x))
   ```

2. **Нет точки с запятой** в конце:
   ```c
   #define MAX 100  // правильно
   #define MAX 100; // ошибка!
   ```

## Пример из практики

Макросы в [[Калькулятор]] (`calculator.h`):

```c
// Константы размеров
#define MAX_INPUT_LEN 100      // максимальная длина ввода
#define MAX_TOKENS 99          // максимальное число токенов
#define MAX_TOKEN_LEN 20       // максимальная длина токена

// Использование в коде
char buffer[MAX_INPUT_LEN];    // буфер для ввода
int tokens[MAX_TOKENS];        // массив токенов
```

Защита от деления на ноль в `div.c`:
```c
int __DIV(int a, int b) {
    if (b == 0) {
        return 0;  // защита от деления на ноль
    }
    return a / b;
}
```

## См. также
- [[Препроцессор C]] — оглавление раздела
- [[undef]]
- [[Оператор stringify]]
- [[Оператор token pasting]]
- [[Калькулятор]] — практический пример с макросами
- [[_main/Изучение языка С. От простых концепций до asm, simd и встраивания в другие языки./Заголовочные файлы/Include guards]] — защита от повторного включения

## Источники
- [CppReference — #define](https://en.cppreference.com/w/c/preprocessor/replace)

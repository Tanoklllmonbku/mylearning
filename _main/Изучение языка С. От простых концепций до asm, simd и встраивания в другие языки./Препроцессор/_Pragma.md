# #_Pragma

**Категория:** Оператор pragma (C99)

## Назначение

Операторная форма `#pragma` для использования в макросах.

## Синтаксис

```c
_Pragma("строка")
```

Эквивалентно `#pragma строка`, но работает в макросах.

## Пример

```c
// Прямое использование
_Pragma("GCC optimize(\"O3\")")

// В макросе
#define OPTIMIZE_LEVEL(n) _Pragma(#GCC optimize(#n))

OPTIMIZE_LEVEL(3)  // раскрывается в #pragma GCC optimize("O3")
```

## Отличие от #pragma

```c
// #pragma НЕ работает в макросах
#define MY_PRAGMA #pragma GCC optimize("O3")  // ОШИБКА!

// _Pragma работает
#define MY_PRAGMA _Pragma("GCC optimize(\"O3\")")  // ОК
MY_PRAGMA
```

## Экранирование кавычек

```c
// Двойные кавычки внутри строки
_Pragma("GCC diagnostic ignored \"-Wunused\"")

// С макросом
#define STRINGIFY(x) #x
#define PRAGMA_OPTIMIZE(level) _Pragma("GCC optimize(" STRINGIFY(level) ")")
```

## Применение

### 1. Условная оптимизация

```c
#if ENABLE_OPTIMIZATIONS
#define OPTIMIZE _Pragma("GCC optimize(\"O3\")")
#else
#define OPTIMIZE
#endif

OPTIMIZE
void critical_function() { }
```

### 2. Временное отключение предупреждений

```c
#define PUSH_WARNINGS _Pragma("GCC diagnostic push")
#define IGNORE_UNUSED _Pragma("GCC diagnostic ignored \"-Wunused\"")
#define POP_WARNINGS _Pragma("GCC diagnostic pop")

PUSH_WARNINGS
IGNORE_UNUSED
int unused_var;
POP_WARNINGS
```

## Источники
- [CppReference — _Pragma](https://en.cppreference.com/w/c/preprocessor/replace)

## См. также
- [[Препроцессор C]] — оглавление раздела
- [[pragma]]

# #pragma

**Категория:** Директива реализации

## Назначение

Передача специфичных компилятору команд.

## Синтаксис

```c
#pragma токен
```

## Стандартные pragma (C11)

### _Pragma (оператор)

```c
_Pragma("GCC optimize(\"O3\")")
```

##Pragma GCC

```c
// Оптимизация
#pragma GCC optimize("O3")
#pragma GCC target("sse4.2,avx")

// Диагностика
#pragma GCC diagnostic error "-Wunused"
#pragma GCC diagnostic warning "-Wimplicit"
#pragma GCC diagnostic ignored "-Wunused-variable"

// Временное отключение предупреждений
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wsign-compare"
// код с предупреждениями
#pragma GCC diagnostic pop
```

## Pragma MSVC

```c
// Выравнивание
#pragma pack(push, 1)
struct Packed { char c; int i; };
#pragma pack(pop)

// Предупреждения
#pragma warning(disable: 4996)
#pragma warning(push)
#pragma warning(disable: 4100)
// код
#pragma warning(pop)

// Сегменты
#pragma code_seg(".text$init")
```

## Pragma Clang

```c
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-parameter"
// код
#pragma clang diagnostic pop
```

## Распространённые pragma

### once (вместо include guards)

```c
#pragma once
// содержимое заголовка
```

### pack (выравнивание структур)

```c
#pragma pack(push, 1)  // выравнивание 1 байт
struct Unaligned {
    char c;
    int i;
};  // 5 байт вместо 8
#pragma pack(pop)
```

### region (группировка кода)

```c
#pragma region "Initialization"
// код инициализации
#pragma endregion
```

## Источники
- [CppReference — #pragma](https://en.cppreference.com/w/c/preprocessor/impl)
- [GCC Pragmas](https://gcc.gnu.org/onlinedocs/gcc/Pragmas.html)
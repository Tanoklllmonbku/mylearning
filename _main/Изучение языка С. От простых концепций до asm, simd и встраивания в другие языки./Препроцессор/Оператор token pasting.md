# Оператор ## (token pasting)

**Категория:** Оператор препроцессора

## Назначение

Объединяет два токена в один.

## Синтаксис

```c
#define MACRO(a, b) a##b
```

## Пример

```c
#define CONCAT(a, b) a##b
#define XCONCAT(a, b) CONCAT(a, b)

// Простое объединение
int CONCAT(var, 123);  // int var123;

// Создание имён функций
#define MAKE_FUNC(name) void init_##name()
MAKE_FUNC(module);     // void init_module()

// С макросами
#define PREFIX mylib
CONCAT(PREFIX, _init);  // mylib_init
```

## Двойное раскрытие

Для раскрытия макросов перед pasting нужно два уровня:

```c
#define LEVEL1(a, b) a##b
#define LEVEL2(a, b) LEVEL1(a, b)

#define X foo
#define Y bar

LEVEL1(X, Y)  // XY (не раскрыто)
LEVEL2(X, Y)  // foobar (раскрыто и объединено)
```

## Применение

### 1. Генерация имён переменных

```c
#define DECLARE_VAR(name, id) \
    int CONCAT(name, _var_, id);

DECLARE_VAR(temp, 1)  // int temp_var_1;
```

### 2. Переключение функций

```c
#define IMPL(version) func_v##version
#define CURRENT_VERSION 2

IMPL(CURRENT_VERSION)();  // func_v2()
```

### 3. Структуры данных

```c
#define DEFINE_TYPE(name) \
    typedef struct name##_t name##_t; \
    void name##_init(name##_t* self); \
    void name##_destroy(name##_t* self);

DEFINE_TYPE(string)
// typedef struct string_t string_t;
// void string_init(string_t* self);
// void string_destroy(string_t* self);
```

## Ограничения

- Результат должен быть **валидным токеном**
- Нельзя объединять строковые литералы
- `##` не может быть в начале или конце замены

## Источники
- [CppReference — Token concatenation](https://en.cppreference.com/w/c/preprocessor/replace)

## См. также
- [[Препроцессор C]] — оглавление раздела
- [[Оператор stringify]]
- [[define]]

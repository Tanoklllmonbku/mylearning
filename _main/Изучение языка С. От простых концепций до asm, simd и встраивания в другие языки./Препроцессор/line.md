# #line

**Категория:** Директива управления строками

## Назначение

Изменение номера строки и имени файла для компилятора.

## Синтаксис

```c
#line число "имя_файла"
#line число
```

## Пример

```c
#line 100 "generated.c"
// Следующая строка считается строкой 101 файла generated.c
printf("Error here");  // в ошибке: generated.c:101
```

## Применение

### 1. Генерация кода

```c
// Генератор кода создаёт:
#line 50 "template.cgen"
int x = 42;  // ошибка укажет template.cgen:50
```

### 2. Отладка макросов

```c
#define LOG_ERROR(msg) \
    _Pragma("line 100 \"error_macros.h\"") \
    fprintf(stderr, "%s", msg)
```

### 3. Скрытие кода

```c
#line 1
// код начинается с "начала файла"
```

## Формы

```c
#line 100           // изменить номер строки
#line 100 "file.c"  // изменить строку и файл
#line 100 "file.c" \n  // многострочное
```

## Макросы после #line

```c
#line 500 "test.c"
printf("%d\n", __LINE__);    // 501 (следующая строка)
printf("%s\n", __FILE__);    // test.c
```

## Источники
- [CppReference — #line](https://en.cppreference.com/w/c/preprocessor/line)

## См. также
- [[Препроцессор C]] — оглавление раздела
- [[__LINE__ __FILE__]]

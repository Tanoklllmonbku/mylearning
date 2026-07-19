# #error и #warning

**Категория:** Директивы диагностики

## Назначение

Генерация ошибок и предупреждений во время компиляции.

## Синтаксис

```c
#error сообщение
#warning сообщение
```

## #error

**Останавливает компиляцию** с ошибкой.

### Примеры

```c
// Проверка платформы
#ifndef __linux__
#error "This code only supports Linux"
#endif

// Проверка размера типа
#if sizeof(int) != 4
#error "int must be 4 bytes"
#endif

// Запрет использования
#ifdef OLD_API
#error "Old API is deprecated, use new_api instead"
#endif
```

## #warning

**Выводит предупреждение**, но компиляция продолжается.

### Примеры

```c
#ifdef DEPRECATED_FUNC
#warning "DEPRECATED_FUNC is deprecated, will be removed in v2.0"
#endif

#if defined(__GNUC__) && __GNUC__ < 5
#warning "GCC version 5 or higher is recommended"
#endif
```

## Применение

### 1. Проверка конфигурации

```c
#if !defined(CONFIG_FILE) && !defined(CONFIG_DB)
#error "Either CONFIG_FILE or CONFIG_DB must be defined"
#endif
```

### 2. Контроль версий

```c
#if API_VERSION < 2
#error "API version 2 or higher required"
#warning "Consider upgrading to API v3"
#endif
```

### 3. Временная блокировка

```c
#if BROKEN_FEATURE_ENABLED
#error "This feature is broken, disable until fixed"
#endif
```

## Различия

| Директива | Компиляция | Вывод |
|-----------|------------|-------|
| `#error` | Останавливается | Ошибка |
| `#warning` | Продолжается | Предупреждение |

## Источники
- [CppReference — #error](https://en.cppreference.com/w/c/preprocessor/error)
- [CppReference — #warning](https://en.cppreference.com/w/c/preprocessor/warning)

## См. также
- [[Препроцессор C]] — оглавление раздела
- [[if_ifdef_ifndef]]

# #undef

**Категория:** Директива отмены определения

## Назначение

Отменяет ранее определённый макрос.

## Синтаксис

```c
#undef имя
```

## Пример

```c
#define DEBUG 1
#define MAX 100

// ... код использует DEBUG и MAX

#undef DEBUG    // отмена DEBUG
#undef MAX      // отмена MAX

// Дальше DEBUG и MAX не определены
#ifdef DEBUG
    // этот код не компилируется
#endif
```

## Применение

### 1. Временное переопределение

```c
#define LOG(x) printf(x)

// ... код с логированием

#undef LOG
#define LOG(x)  // пустой макрос (отключено)

// ... код без логирования
```

### 2. Избегание конфликтов

```c
// В заголовочном файле
#ifdef MAX
#undef MAX  // убираем конфликт
#endif

#define MAX(a, b) ((a) > (b) ? (a) : (b))
```

## Ошибки

```c
#undef UNDEFINED  // НЕ ошибка, игнорируется
```

## См. также
- [[Препроцессор C]] — оглавление раздела
- [[define]]

## Источники
- [CppReference — #undef](https://en.cppreference.com/w/c/preprocessor/replace)

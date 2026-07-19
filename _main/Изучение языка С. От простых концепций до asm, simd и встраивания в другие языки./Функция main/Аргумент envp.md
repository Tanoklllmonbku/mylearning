# Аргумент `envp` (Environment Pointer)

## Определение

`envp` (environment pointer) — **третий параметр** функции `main`, представляющий массив строк с **переменными окружения**, доступными программе при запуске.

```c
int main(int argc, char *argv[], char *envp[]) {
    // envp — массив строк переменных окружения
}
```

## Статус в стандарте

### Реализационно-определённая форма

`envp` **не является частью стандарта C**. Это распространённое **расширение реализации**, поддерживаемое большинством компиляторов:

| Стандарт | Статус `envp` |
|----------|---------------|
| C89/C90 | Не определён |
| C99/C11/C17/C23 | Реализационно-определённая форма (§5.1.2.2.1) |
| POSIX | Требуется через `environ` |

Стандарт C допускает дополнительные параметры:

> «...or in some other implementation-defined manner»

## Характеристики

### Тип данных

- **Тип**: `char *[]` (массив указателей на `char`) или `char **`
- **Содержимое**: указатели на строки формата `"NAME=VALUE"`
- **Терминатор**: последний элемент — `NULL`

### Формат строк

Каждая строка в `envp` имеет формат:

```
"ИМЯ_ПЕРЕМЕННОЙ=ЗНАЧЕНИЕ"
```

Примеры:
- `"PATH=/usr/bin:/bin"`
- `"HOME=/home/user"`
- `"LANG=ru_RU.UTF-8"`

## Структура массива

```
envp ────────────────────────────────────────┐
                                             │
  ┌─────┬─────┬─────┬─────┐                  │
  │envp │envp │envp │envp │                  │
  │ [0] │ [1] │ [2] │ [3] │                  │
  └──┬──┴──┬──┴──┬──┴──┬──┘                  │
     │     │     │     │                     │
     │     │     │     ▼                     │
     │     │     │   NULL ◄──────────────────┘
     │     │     │   (конец массива)
     │     │     │
     │     │     ▼
     │     │   "HOME=/home/user"
     │     │
     │     ▼
     │   "PATH=/usr/bin:/bin"
     │
     ▼
   "USER=progger"
```

## Примеры использования

### Базовый пример

```c
#include <stdio.h>

int main(int argc, char *argv[], char *envp[]) {
    printf("Переменные окружения:\n");
    
    for (int i = 0; envp[i] != NULL; ++i) {
        printf("  %s\n", envp[i]);
    }
    
    return 0;
}
```

**Вывод:**
```
Переменные окружения:
  USER=progger
  HOME=/home/progger
  PATH=/usr/bin:/bin
  LANG=ru_RU.UTF-8
  ...
```

### Поиск конкретной переменной

```c
#include <stdio.h>
#include <string.h>

char *find_env(char *envp[], const char *name) {
    size_t len = strlen(name);
    
    for (int i = 0; envp[i] != NULL; ++i) {
        // Проверяем начало строки
        if (strncmp(envp[i], name, len) == 0 && envp[i][len] == '=') {
            return envp[i] + len + 1;  // Возвращаем значение после '='
        }
    }
    
    return NULL;  // Переменная не найдена
}

int main(int argc, char *argv[], char *envp[]) {
    char *path = find_env(envp, "PATH");
    
    if (path != NULL) {
        printf("PATH = %s\n", path);
    } else {
        printf("Переменная PATH не найдена\n");
    }
    
    return 0;
}
```

### Подсчёт переменных окружения

```c
#include <stdio.h>

int main(int argc, char *argv[], char *envp[]) {
    int count = 0;
    
    while (envp[count] != NULL) {
        ++count;
    }
    
    printf("Количество переменных окружения: %d\n", count);
    return 0;
}
```

## Альтернативный доступ к переменным окружения

### Глобальная переменная `environ`

POSIX определяет глобальную переменную `environ`:

```c
#include <unistd.h>

extern char **environ;

int main(int argc, char *argv[]) {
    // Доступ через environ вместо envp
    for (int i = 0; environ[i] != NULL; ++i) {
        printf("%s\n", environ[i]);
    }
    return 0;
}
```

### Функция `getenv`

Стандартная функция `<stdlib.h>` для получения переменных окружения:

```c
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    char *home = getenv("HOME");
    
    if (home != NULL) {
        printf("Домашняя директория: %s\n", home);
    } else {
        printf("Переменная HOME не установлена\n");
    }
    
    return 0;
}
```

**Преимущества `getenv`:**
- Стандарт C (переносимость)
- Не требует передачи `envp` в `main`
- Проще в использовании

## Сравнение подходов

### Доступ к переменным окружения

| Способ | Стандарт | Переносимость | Удобство |
|--------|----------|---------------|----------|
| `envp` в `main` | Расширение | Хорошая (Unix, Windows) | Требует передачи |
| `environ` | POSIX | Unix-системы | Глобальная переменная |
| `getenv()` | C89+ | Отличная | Простой вызов |

### Сравнение функций получения переменных

| Характеристика | `envp` (параметр `main`) | `getenv` (C89/90) | `getenv_s` (C11) |
|----------------|--------------------------|-------------------|------------------|
| **Стандарт** | Расширение реализации | ISO C89/90 | ISO C11 (Annex K) |
| **Безопасность** | Небезопасный (прямой доступ) | ⚠️ Небезопасный (deprecated) | ✅ Безопасный с проверкой границ |
| **Возвращаемое значение** | Массив `char*` | Указатель на строку или `NULL` | Код ошибки (`errno_t`) |
| **Проверка размера** | Нет | Нет | Требует размер буфера |
| **Потокобезопасность** | ⚠️ Зависит от реализации | ❌ Не потокобезопасна | ❌ Не потокобезопасна |
| **Модификация результата** | Можно изменять строку | ❌ Нельзя изменять | Копия в буфер |
| **Доступность** | Только в `main` | В любом месте программы | В любом месте программы |
| **Переносимость** | Хорошая (не стандарт) | Отличная | Ограниченная (Annex K) |
| **Обработка ошибок** | N/A | Возврат `NULL` | `errno_t` + `pReturnValue` |

### Подробное сравнение `getenv` vs `getenv_s`

| Аспект | `getenv` | `getenv_s` |
|--------|----------|------------|
| **Сигнатура** | `char *getenv(const char *varname)` | `errno_t getenv_s(size_t *pRet, char *buf, size_t nElem, const char *name)` |
| **Буфер** | Не требуется (возвращает указатель на внутренние данные) | Требуется внешний буфер |
| **Размер результата** | Неизвестен заранее | Записывается в `pReturnValue` |
| **Предупреждение компилятора** | ⚠️ C4996 (deprecated в MSVC) | Нет |
| **UWP поддержка** | ❌ Нет | ❌ Нет |
| **Режим работы** | Прямой доступ к `_environ` | Копирование в буфер пользователя |

### Примеры использования

```c
// ============= envp — только в main =============
int main(int argc, char *argv[], char *envp[]) {
    char *path = NULL;
    for (int i = 0; envp[i] != NULL; ++i) {
        if (strncmp(envp[i], "PATH=", 5) == 0) {
            path = envp[i] + 5;  // Можно изменять
            break;
        }
    }
}

// ============= getenv — устаревшая, но переносимая =============
#include <stdlib.h>
char *path = getenv("PATH");  // ⚠️ Deprecated в MSVC
if (path != NULL) {
    // ❌ НЕЛЬЗЯ изменять path напрямую
    printf("PATH = %s\n", path);
}

// ============= getenv_s — безопасная версия (C11, Annex K) =============
#include <stdlib.h>

// Способ 1: Двухэтапный вызов (определение размера)
size_t requiredSize;
errno_t err = getenv_s(&requiredSize, NULL, 0, "PATH");
if (err == 0 && requiredSize > 0) {
    char *buffer = (char*)malloc(requiredSize * sizeof(char));
    if (buffer != NULL) {
        err = getenv_s(&requiredSize, buffer, requiredSize, "PATH");
        if (err == 0) {
            printf("PATH = %s\n", buffer);
        }
        free(buffer);
    }
}

// Способ 2: Фиксированный буфер
char buffer[256];
size_t len;
err = getenv_s(&len, buffer, sizeof(buffer), "PATH");
if (err == 0 && len > 0) {
    printf("PATH = %s\n", buffer);  // ✅ Копия в буфере
}
```

### Коды ошибок `getenv_s`

| Условие | Возвращаемое значение | `errno` |
|---------|----------------------|---------|
| Успех | `0` | — |
| `pReturnValue == NULL` | `EINVAL` | `EINVAL` |
| `buffer == NULL` (при `numberOfElements > 0`) | `EINVAL` | `EINVAL` |
| `varname == NULL` | `EINVAL` | `EINVAL` |
| Буфер слишком мал | `ERANGE` | — |

**Примечание:** При ошибке `ERANGE` функция записывает необходимый размер буфера в `pReturnValue`, позволяя повторить вызов с большим буфером.

## Модифицируемость

Строки в `envp` **модифицируемы**, но изменения могут не отражаться на реальной среде окружения:

```c
// ❌ Не рекомендуется: изменение envp не влияет на окружение
envp[0][0] = 'X';  // Может работать, но бессмысленно

// ✅ Правильно: использовать setenv/putenv для изменения окружения
#include <stdlib.h>
setenv("MY_VAR", "value", 1);  // POSIX
```

## Специфика платформ

### Unix/Linux

- `envp` передаётся ядром при запуске процесса
- Переменные окружения наследуются от родительского процесса
- Доступ через `environ` (POSIX)

```bash
$ export MY_VAR="hello"
$ ./program
# MY_VAR будет в envp
```

### Windows

- Переменные окружения передаются как блок памяти
- Формат: `"NAME=VALUE\0"` для каждой переменной
- Доступ через API Windows (`GetEnvironmentVariable`)

```cmd
> set MY_VAR=hello
> program.exe
```

### macOS

- Аналогично Unix
- Дополнительные переменные (`DYLD_*`, `__CF*`)

## Пример: утилита `env`

Упрощённая реализация команды `env`:

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char *argv[], char *envp[]) {
    // Если есть аргументы — запустить команду с новым окружением
    if (argc > 1) {
        execvp(argv[1], &argv[1]);  // execvp использует environ
        perror("execvp failed");
        return EXIT_FAILURE;
    }
    
    // Иначе — вывести текущее окружение
    for (int i = 0; envp[i] != NULL; ++i) {
        printf("%s\n", envp[i]);
    }
    
    return 0;
}
```

## Ограничения и предупреждения

### 1. Нестандартность

`envp` не является частью стандарта C:

```c
// ⚠️ Непереносимый код
int main(int argc, char *argv[], char *envp[]) { }

// ✅ Переносимый код
#include <stdlib.h>

int main(int argc, char *argv[]) {
    char *home = getenv("HOME");  // Стандартный способ
}
```

### 2. Порядок переменных

Порядок переменных в `envp` **не определён**:

```c
// Нельзя полагаться на порядок
if (strcmp(envp[0], "PATH=...") == 0) {  // ❌ Ненадёжно
    // ...
}
```

### 3. Пустые значения

Переменная может иметь пустое значение:

```c
"EMPTY_VAR="  // Допустимо: имя есть, значение пустое
```

## Источники

- [Microsoft: Main function parameters](https://learn.microsoft.com/ru-ru/cpp/c-language/main-function-and-program-execution?view=msvc-170)
- [Microsoft: getenv, _wgetenv](https://learn.microsoft.com/ru-ru/cpp/c-runtime-library/reference/getenv-wgetenv?view=msvc-170)
- [Microsoft: getenv_s, _wgetenv_s](https://learn.microsoft.com/ru-ru/cpp/c-runtime-library/reference/getenv-s-wgetenv-s?view=msvc-170)
- [cppreference: Main function](https://en.cppreference.com/w/c/language/main_function.html)
- [POSIX: environ](https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.html)
- ISO/IEC 9899:2018 §5.1.2.2.1

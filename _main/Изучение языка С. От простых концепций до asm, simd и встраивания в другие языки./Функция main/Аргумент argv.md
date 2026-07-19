# Аргумент `argv` (Argument Vector)

## Определение

`argv` (argument vector) — второй параметр функции `main`, представляющий **массив строк** с аргументами командной строки, переданными программе при запуске.

```c
int main(int argc, char *argv[]) {
    // argv — массив строк аргументов
}
```

## Характеристики

### Тип данных

- **Тип**: `char *[]` (массив указателей на `char`) или эквивалентно `char **`
- **Размер**: `argc + 1` элементов (Последний элемент - конец массива строк)
- **Последний элемент**: `argv[argc] == NULL` (гарантировано стандартом)

### Эквивалентные объявления

```c
int main(int argc, char *argv[]);    // Массив указателей
int main(int argc, char **argv);     // Указатель на указатель
int main(int argc, char **av);       // Любое имя допустимо
```

## Структура массива

```
argc = 4

argv ────────────────────────────────────────┐
                                             │
  ┌─────┬─────┬─────┬─────┬─────┐            │
  │ argv│ argv│ argv│ argv│ argv│            │
  │ [0] │ [1] │ [2] │ [3] │ [4] │            │
  └──┬──┴──┬──┴──┬──┴──┬──┴──┬──┘            │
     │     │     │     │     │               │
     │     │     │     │     ▼               │
     │     │     │     │   NULL ◄────────────┘
     │     │     │     │   (argv[argc])
     │     │     │     │
     │     │     │     ▼
     │     │     │   "arg2"
     │     │     │
     │     │     ▼
     │     │   "arg1"
     │     │
     │     ▼
     │   "program_name"
     │
     ▼
  (массив указателей)
```

## Элементы массива

| Индекс | Значение | Описание |
|--------|----------|----------|
| `argv[0]` | `char*` | Имя программы (может быть пустой строкой) |
| `argv[1]` … `argv[argc-1]` | `char*` | Аргументы командной строки |
| `argv[argc]` | `NULL` | Гарантированный нулевой указатель |

## Примеры использования

### Базовый пример

```c
#include <stdio.h>

int main(int argc, char *argv[]) {
    printf("Программа: %s\n", argv[0]);
    
    for (int i = 1; i < argc; ++i) {
        printf("Аргумент %d: %s\n", i, argv[i]);
    }
    
    return 0;
}
```

**Вывод:**
```
$ ./calc add 5 3
Программа: ./calc
Аргумент 1: add
Аргумент 2: 5
Аргумент 3: 3
```

### Итерация до NULL

```c
// Альтернативный способ итерации (без использования argc)
for (char **arg = argv; *arg != NULL; ++arg) {
    printf("Аргумент: %s\n", *arg);
}
```

### Доступ к последнему аргументу

```c
if (argc > 1) {
    char *last_arg = argv[argc - 1];
    printf("Последний аргумент: %s\n", last_arg);
}
```

## Важные свойства

### 1. Модифицируемость строк

Строки, на которые указывает `argv`, **модифицируемы**:

```c
#include <stdio.h>

int main(int argc, char *argv[]) {
    if (argc > 1) {
        // Можно изменять аргументы
        argv[1][0] = 'X';
        printf("Изменённый аргумент: %s\n", argv[1]);
    }
    return 0;
}
```

**Вывод:**
```
$ ./program hello
Изменённый аргумент: Xello
```

### 2. `argv[0]` — имя программы

`argv[0]` обычно содержит имя программы, но стандарт допускает вариации:

```c
#include <stdio.h>

int main(int argc, char *argv[]) {
    if (argc > 0 && argv[0] != NULL) {
        if (argv[0][0] == '\0') {
            printf("Имя программы недоступно (пустая строка)\n");
        } else {
            printf("Имя программы: %s\n", argv[0]);
        }
    } else {
        printf("argc = 0, argv[0] недоступен\n");
    }
    return 0;
}
```

**Возможные значения `argv[0]`:**
- `"./program"` — относительный путь
- `"/usr/bin/program"` — абсолютный путь
- `"program"` — только имя
- `""` — пустая строка (если имя недоступно)

### 3. Гарантированный `NULL`-терминатор

Стандарт C гарантирует: `argv[argc] == NULL`

```c
// Это всегда истинно:
assert(argv[argc] == NULL);

// Безопасная итерация:
for (int i = 0; i < argc; ++i) {
    // argv[i] валиден и не NULL
}
// argv[argc] == NULL — можно использовать как условие окончания
```

## Обработка аргументов

### Парсинг флагов

```c
#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
    int verbose = 0;
    char *filename = NULL;
    
    for (int i = 1; i < argc; ++i) {
        if (strcmp(argv[i], "-v") == 0 || strcmp(argv[i], "--verbose") == 0) {
            verbose = 1;
        } else if (argv[i][0] != '-') {
            filename = argv[i];
        }
    }
    
    if (verbose) {
        printf("Режим отладки включён\n");
    }
    if (filename) {
        printf("Файл: %s\n", filename);
    }
    
    return 0;
}
```

### Копирование аргументов

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
    // Копирование массива аргументов
    char **args_copy = malloc((argc + 1) * sizeof(char*));
    
    for (int i = 0; i <= argc; ++i) {
        args_copy[i] = argv[i];  // Копируем указатели (включая NULL)
    }
    
    // Использование args_copy...
    
    free(args_copy);  // Не освобождаем строки — они принадлежат CRT
    return 0;
}
```

## Специфика платформ

### Unix/Linux

- Аргументы — это копия строки командной строки
- Оболочка обрабатывает подстановки до передачи программе
- `argv` размещается в памяти процесса

```bash
$ ./program *.txt
# Оболочка раскроет * в список файлов перед запуском
```

### Windows

- Аргументы передаются как единая строка
- CRT парсит строку в массив `argv`
- Правила экранирования отличаются от Unix

```cmd
> program.exe "C:\Program Files\app\data.txt"
# argv[1] = "C:\Program Files\app\data.txt"
```

## Ошибки и предупреждения

### Выход за границы

```c
// ❌ ОПАСНО: выход за границы
for (int i = 0; i <= argc; ++i) {
    printf("%s\n", argv[i]);  // argv[argc] == NULL!
}
// При i == argc: разыменование NULL → сегментация

// ✅ Безопасно
for (int i = 0; i < argc; ++i) {
    printf("%s\n", argv[i]);
}
```

### Модификация за пределами

```c
// ❌ Нельзя изменять сам массив argv (указатели)
argv[0] = "hacked";  // Может работать, но не рекомендуется

// ✅ Можно изменять содержимое строк
argv[0][0] = 'H';  // Допустимо
```

## Связь с `argc`

Итого, в argv находятся argc-1 (Programm_name) параметров и argc аргументов.
Размер argv всегда равен (С Null-терминатором) - argc+1 (Добавляется по требованиям стандарта).
`argc` и `argv` образуют пару:

| Параметр | Роль | Зависимость |
|----------|------|-------------|
| `argc` | Счётчик аргументов | Определяет количество валидных элементов |
| `argv` | Вектор аргументов | Содержит `argc + 1` элементов |

**Инварианты:**
- `argv[0..argc-1]` — валидные указатели на строки
- `argv[argc] == NULL`
- `argc >= 0`

## Источники

- [Microsoft: Main function parameters](https://learn.microsoft.com/ru-ru/cpp/c-language/main-function-and-program-execution?view=msvc-170)
- [cppreference: Main function](https://en.cppreference.com/w/c/language/main_function.html)
- ISO/IEC 9899:2018 §5.1.2.2.1

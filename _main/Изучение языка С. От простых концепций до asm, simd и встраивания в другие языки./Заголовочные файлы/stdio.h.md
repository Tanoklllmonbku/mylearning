# stdio.h

**Назначение:** Стандартный ввод/вывод.

## Потоки

```c
stdin    // стандартный ввод (0)
stdout   // стандартный вывод (1)
stderr   // стандартный error (2)
```

## Функции ввода

### Посимвольный ввод

```c
int getchar(void);           // символ из stdin
int getc(FILE* stream);      // символ из потока
char* fgets(char* s, int n, FILE* stream);  // строка
```

### Форматированный ввод

```c
int scanf(const char* fmt, ...);
int fscanf(FILE* stream, const char* fmt, ...);
int sscanf(const char* s, const char* fmt, ...);
```

## Функции вывода

### Посимвольный вывод

```c
int putchar(int c);          // символ в stdout
int putc(int c, FILE* stream);  // символ в поток
int puts(const char* s);     // строка в stdout
int fputs(const char* s, FILE* stream);
```

### Форматированный вывод

```c
int printf(const char* fmt, ...);
int fprintf(FILE* stream, const char* fmt, ...);
int sprintf(char* str, const char* fmt, ...);
int snprintf(char* str, size_t n, const char* fmt, ...);
```

## Работа с файлами

```c
FILE* fopen(const char* path, const char* mode);
FILE* freopen(const char* path, const char* mode, FILE* stream);
int fclose(FILE* stream);
int fflush(FILE* stream);

size_t fread(void* ptr, size_t size, size_t count, FILE* stream);
size_t fwrite(const void* ptr, size_t size, size_t count, FILE* stream);

int fseek(FILE* stream, long offset, int origin);
long ftell(FILE* stream);
void rewind(FILE* stream);

int feof(FILE* stream);
int ferror(FILE* stream);
void clearerr(FILE* stream);
```

## Примеры

### Простой вывод

```c
#include <stdio.h>

int main() {
    // Простой вывод
    printf("Hello, %s!\n", "World");

    // Чтение строки
    char buffer[100];
    fgets(buffer, sizeof(buffer), stdin);

    // Работа с файлом
    FILE* f = fopen("data.txt", "r");
    if (f) {
        int x;
        fscanf(f, "%d", &x);
        fclose(f);
    }

    // Запись в файл
    FILE* out = fopen("output.txt", "w");
    fprintf(out, "Value: %d\n", 42);
    fclose(out);

    return 0;
}
```

### Пример из практики

Базовое использование `printf()` в [[Hello World]]:

```c
#include <stdio.h>

int main() {
    printf("Hello, World!\n");  // простой вывод в stdout
    return 0;
}
```

Примеры работы с вводом/выводом в [[Калькулятор]]:
- `scanf_input()` — чтение пользовательского ввода
- `printf()` — вывод результатов вычислений

## Режимы fopen

| Режим | Описание |
|-------|----------|
| `"r"` | Чтение (файл должен существовать) |
| `"w"` | Запись (создать/очистить) |
| `"a"` | Добавление (создать если нет) |
| `"r+"` | Чтение + запись |
| `"w+"` | Запись + чтение |
| `"a+"` | Добавление + чтение |
| `"b"` | Бинарный режим (добавляется к режиму) |

## Источники
- [CppReference — stdio.h](https://en.cppreference.com/w/c/header/stdio_h)

## См. также
- [[Заголовочные файлы C]] — оглавление раздела
- [[stdlib.h]]
- [[string.h]]
- [[Hello World]] — пример использования printf()
- [[Калькулятор]] — пример работы с вводом/выводом

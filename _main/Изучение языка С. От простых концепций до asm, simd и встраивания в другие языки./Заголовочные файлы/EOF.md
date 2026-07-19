# EOF

**EOF** (End Of File) — специальная константа для обозначения конца файла или потока.

## Определение

```c
#include <stdio.h>

// EOF — отрицательное целое
#define EOF (-1)
```

## Тип

- `EOF` имеет тип `int` (не `char`!)
- Значение: `-1`
- Все символы имеют неотрицательные значения (0-255)

## Использование

### 1. Чтение до конца файла

```c
#include <stdio.h>

int main() {
    int c;  // ВАЖНО: int, не char!
    
    while ((c = getchar()) != EOF) {
        putchar(c);
    }
    
    return 0;
}
```

### 2. Проверка результата fscanf

```c
#include <stdio.h>

int main() {
    FILE* f = fopen("data.txt", "r");
    int x, n;
    
    n = fscanf(f, "%d", &x);
    if (n == EOF) {
        printf("Ошибка или конец файла\n");
    }
    
    fclose(f);
    return 0;
}
```

### 3. Проверка результата fgetc

```c
#include <stdio.h>

int main() {
    FILE* f = fopen("file.txt", "r");
    int c;
    
    while ((c = fgetc(f)) != EOF) {
        printf("%c", c);
    }
    
    // Проверка причины EOF
    if (feof(f)) {
        printf("Достигнут конец файла\n");
    }
    if (ferror(f)) {
        printf("Произошла ошибка\n");
    }
    
    fclose(f);
    return 0;
}
```

## Важные правила

### 1. Используйте int для хранения

```c
// ПЛОХО — char может быть 255, что совпадёт с EOF
char c;
while ((c = getchar()) != EOF) { }  // может зациклиться!

// ХОРОШО
int c;
while ((c = getchar()) != EOF) { }
```

### 2. EOF не является символом в файле

```c
// EOF возвращается функциями, не хранится в файле
int c = fgetc(f);
if (c == EOF) {
    // конец файла, а не символ -1
}
```

### 3. Различайте EOF и ошибку

```c
int c = fgetc(f);

if (c == EOF) {
    if (feof(f)) {
        // нормальный конец файла
    } else if (ferror(f)) {
        // ошибка чтения
        clearerr(f);
    }
}
```

## Функции, возвращающие EOF

| Функция | Возвращает EOF при |
|---------|-------------------|
| `getchar()` | конец stdin |
| `fgetc(f)` | конец файла или ошибка |
| `getc(f)` | конец файла или ошибка |
| `fscanf(f, ...)` | ошибка или конец перед конверсией |
| `scanf(...)` | ошибка или конец перед конверсией |

## Пример: подсчёт символов

```c
#include <stdio.h>

int main() {
    long count = 0;
    int c;
    
    while ((c = getchar()) != EOF) {
        count++;
    }
    
    printf("Total characters: %ld\n", count);
    return 0;
}
```

## Пример: копирование файла

```c
#include <stdio.h>

int main() {
    FILE* in = fopen("input.txt", "r");
    FILE* out = fopen("output.txt", "w");
    int c;
    
    if (!in || !out) {
        perror("fopen");
        return 1;
    }
    
    while ((c = fgetc(in)) != EOF) {
        fputc(c, out);
    }
    
    fclose(in);
    fclose(out);
    return 0;
}
```

## Ввод с клавиатуры (сигнал EOF)

| ОС | Комбинация |
|----|------------|
| Windows | `Ctrl+Z` + Enter |
| Linux/macOS | `Ctrl+D` |

```c
// Программа ждёт ввода
while ((c = getchar()) != EOF) {
    putchar(c);
}
// Пользователь нажимает Ctrl+D (Linux) или Ctrl+Z (Windows)
```

## Источники
- [CppReference — EOF](https://en.cppreference.com/w/c/io/EOF)
- [CppReference — fgetc](https://en.cppreference.com/w/c/io/fgetc)

## См. также
- [[Заголовочные файлы C]] — оглавление раздела
- [[stdio.h]] — определение EOF
- [[stdio.h]] — ввод/вывод

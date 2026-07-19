# Объявление функции `main`

Согласно стандарту C, в **hosted-среде** (с операционной системой) программа должна содержать **определение** функции `main`.

## Формы объявления

Стандарт C определяет две основные формы объявления `main`:

```c
int main(void) { /* тело */ }                    // (1) Без параметров
int main(int argc, char *argv[]) { /* тело */ }  // (2) С параметрами
```

Начиная с **C99**, допускается третья форма — реализационно-определённая сигнатура:

```c
/* (3) Реализационно-определённая форма */
int main(int argc, char *argv[], char *envp[]);
```

## Важные требования

### 1. Определение, а не прототип

Программа должна предоставлять **определение** функции `main`, а не просто прототип:

```c
// ❌ НЕЛЬЗЯ: только прототип
int main(int argc, char *argv[]);

// ✅ МОЖНО: определение
int main(int argc, char *argv[]) {
    return 0;
}
```

### 2. Возвращаемый тип

| Стандарт | Требование |
|----------|------------|
| C89/C90/C99/C11/C17/C23 | `int` (обязательно) |
| MSVC (расширение) | `void` (допускается, но нестандартно) |

```c
// ✅ Стандартно
int main(void) { return 0; }

// ⚠️ Нестандартно (только MSVC)
void main(void) { }
```

### 3. Имена параметров

Имена `argc`, `argv`, `envp` являются **традиционными**, но компилятор не требует именно этих имён:

```c
// Все эквивалентны:
int main(int argc, char *argv[])
int main(int ac, char **av)
int main(int count, char **args)
```

## Возвращаемое значение

| Значение | Семантика |
|----------|-----------|
| `0` или `EXIT_SUCCESS` | Успешное завершение |
| `EXIT_FAILURE` | Неуспешное завершение |
| Другие значения | Реализуемо-зависимый статус |

### Поведение возврата

**До C99:**
- Если `main` достигает закрывающей `}` без `return` — статус возврата **неопределён**

**Начиная с C99:**
- Если тип возврата `int` и управление достигает конца функции — неявно возвращается `0`
- Если тип возврата не совместим с `int` (например, `void`) — значение возврата **неуказано**

```c
// C99 и выше: эквивалентно return 0;
int main(void) {
    printf("Hello\n");
} // неявный return 0;
```

## Примеры

### Минимальная программа

```c
#include <stdio.h>

int main(void) {
    printf("Hello, World!\n");
    return 0;
}
```

### С аргументами командной строки

```c
#include <stdio.h>

int main(int argc, char *argv[]) {
    printf("argc = %d\n", argc);
    for (int i = 0; i < argc; ++i) {
        printf("argv[%d] = %s\n", i, argv[i]);
    }
    return 0;
}
```

### С переменными окружения (расширение)

```c
#include <stdio.h>

int main(int argc, char *argv[], char *envp[]) {
    printf("Environment variables:\n");
    for (int i = 0; envp[i] != NULL; ++i) {
        printf("  %s\n", envp[i]);
    }
    return 0;
}
```

## Unicode-версия (MSVC)

Для проектов с поддержкой Unicode Microsoft предоставляет `wmain`:

```c
int wmain(int argc, wchar_t *argv[], wchar_t *envp[]);
```

## Источники

- [Microsoft: Main function](https://learn.microsoft.com/ru-ru/cpp/c-language/main-function-and-program-execution?view=msvc-170)
- [cppreference: Main function](https://en.cppreference.com/w/c/language/main_function.html)

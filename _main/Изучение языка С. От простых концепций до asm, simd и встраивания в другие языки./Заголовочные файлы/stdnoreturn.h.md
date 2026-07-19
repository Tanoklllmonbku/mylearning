# stdnoreturn.h

**Назначение:** Спецификатор `_Noreturn` (C11).

## Макрос

```c
noreturn  // раскрывается как _Noreturn
```

## Назначение

Указывает, что функция **никогда не возвращает** управление.

## Примеры

```c
#include <stdnoreturn.h>
#include <stdlib.h>

// Функция не возвращает
noreturn void fatal_error(const char* msg) {
    fprintf(stderr, "FATAL: %s\n", msg);
    exit(1);
}

// Бесконечный цикл
noreturn void idle_loop(void) {
    while (1) {
        // ожидание
    }
}

// Перезапуск программы
noreturn void restart(void) {
    cleanup();
    execve(argv[0], argv, envp);
    // execve не возвращает при успехе
}

int main() {
    if (error_condition) {
        fatal_error("Something went wrong");
        // код здесь не выполнится
    }
    
    return 0;
}
```

## Преимущества

1. **Оптимизация** — компилятор не сохраняет контекст
2. **Предупреждения** — нет warning о missing return
3. **Документирование** — явно указано поведение

## Без stdnoreturn.h

```c
// C99 / C11 без заголовка
_Noreturn void crash(void) {
    abort();
}

// GCC/Clang атрибут
void crash(void) __attribute__((noreturn));

// MSVC
__declspec(noreturn) void crash(void);
```

## Источники
- [CppReference — stdnoreturn.h](https://en.cppreference.com/w/c/header/stdnoreturn_h)

## См. также
- [[Заголовочные файлы C]] — оглавление раздела
- [[_Noreturn]]
- [[stdlib.h]]

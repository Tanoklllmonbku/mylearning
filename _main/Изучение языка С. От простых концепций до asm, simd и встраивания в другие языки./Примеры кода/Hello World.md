# Hello World

Первая программа на C из `_resources/base_level_C/hello_world/`.

## Исходный код

```c
// hello_world.c
#include <stdio.h>

int main() {
    // Prints "Hello, World" to the console
    printf("Hello, World!\n");
    return 0;
}
```

## Компиляция

```bash
gcc hello_world.c -o hello_world
./hello_world
```

## Вывод

```
Hello, World!
```

## Разбор кода

| Строка | Описание |
|--------|----------|
| `#include <stdio.h>` | Подключение заголовка ввода/вывода |
| `int main()` | Точка входа в программу |
| `printf(...)` | Вывод строки в консоль |
| `return 0` | Успешное завершение |

## См. также
- [[Примеры кода]] — оглавление примеров
- [[stdio.h]] — заголовок ввода/вывода
- [[Компиляция одного файла]]
- [[Книжки, ссылки, материалы, статьи.#Примеры кода]]

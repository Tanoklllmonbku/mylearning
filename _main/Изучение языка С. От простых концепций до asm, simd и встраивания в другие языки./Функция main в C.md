# Функция `main` в C

Функция `main` — точка входа в программу на языке C. Это специальная функция, которая вызывается средой выполнения при запуске программы.

## Оглавление

### Базовые темы
- [[Объявление функции main]] — формы объявления, сигнатуры, требования стандарта
- [[Ограничение inline для main]] — почему нельзя использовать `inline`
- [[Ограничение static для main]] — почему нельзя использовать `static`
- [[Почему main объявляется неявно]] — механизм неявного объявления

### Параметры функции main
- [[Аргумент argc]] — количество аргументов командной строки
- [[Аргумент argv]] — массив строк аргументов
- [[Аргумент envp]] — переменные окружения (расширение реализации)
- [[getenv vs envp. getenv vs getenv_s]] — стандартизация получения переменных окружения. Защищённые переменные _s

### Завершение программы
- [[Завершение программы и передача управления]] — return из main, поток управления
- [[Функция exit и альтернативы]] — `exit()`, `_Exit()`, `quick_exit()`, `abort()`

## Краткая сводка

| Аспект | Требование |
|--------|------------|
| Имя функции | `main` (обязательно) |
| Возвращаемый тип | `int` (стандарт), `void` (MSVC, нестандартно) |
| Формы объявления | `int main(void)`, `int main(int argc, char *argv[])` |
| `inline` | ❌ Запрещено |
| `static` | ❌ Запрещено |
| Получение адреса | ❌ Запрещено |
| Рекурсивный вызов | ❌ Запрещено |
| Завершение | `return`, конец функции, `exit()`, `_Exit()`, `abort()` |

## Стандарты

- **C23** (ISO/IEC 9899:2024): §5.1.2.2.1
- **C17** (ISO/IEC 9899:2018): §5.1.2.2.1
- **C11** (ISO/IEC 9899:2011): §5.1.2.2.1
- **C99** (ISO/IEC 9899:1999): §5.1.2.2.1

## Источники

- [Microsoft: Main function and program execution](https://learn.microsoft.com/ru-ru/cpp/c-language/main-function-and-program-execution?view=msvc-170)
- [cppreference: Main function](https://en.cppreference.com/w/c/language/main_function.html)
- [cppreference: exit](https://en.cppreference.com/w/c/program/exit)
- [cppreference: _Exit](https://en.cppreference.com/w/c/program/_Exit)
- [cppreference: quick_exit](https://en.cppreference.com/w/c/program/quick_exit)
- [cppreference: abort](https://en.cppreference.com/w/c/program/abort)
- [cppreference: atexit](https://en.cppreference.com/w/c/program/atexit)

## Примеры из практики

Базовый пример `main()` в [[Hello World]]:

```c
int main() {
    printf("Hello, World!\n");
    return 0;  // успешное завершение
}
```

Пример `main()` с циклом ввода в [[Калькулятор]]:

```c
int main() {
    char buffer[MAX_INPUT_LEN];

    while (1) {
        printf("Enter the expression:\n");
        scan_input(buffer, sizeof(buffer));

        int result = get_result(buffer);
        printf("Result: %d\n", result);
    }

    return 0;
}
```

## См. также
- [[_main/Изучение языка С. От простых концепций до asm, simd и встраивания в другие языки./Ключевые слова/int]] — тип возвращаемого значения
- [[return]] — возврат значения
- [[stdio.h]] — ввод/вывод
- [[Hello World]] — простая программа
- [[Калькулятор]] — программа с циклом ввода

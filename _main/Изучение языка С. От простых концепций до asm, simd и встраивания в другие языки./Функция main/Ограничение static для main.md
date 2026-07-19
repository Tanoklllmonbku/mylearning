# Ограничение `static` для функции `main`

## Запрет на использование `static`

Функция `main` **не может** быть объявлена с ключевым словом `static`:

```c
// ❌ ЗАПРЕЩЕНО: main не может быть static
static int main(int argc, char *argv[]) {
    return 0;
}
```

## Причины ограничения

### 1. Видимость для среды выполнения

Ключевое слово `static` для функции на уровне файла означает:
- **Внутренняя линковка** (internal linkage)
- Функция видима **только в пределах текущего трансляционного модуля**
- Символ не экспортируется в таблицу символов объектного файла

```c
// static-функция в файле:
static void helper(void) { }  // Видна только в этом .c файле

// non-static функция:
void public_func(void) { }    // Видна линковщику и другим модулям
```

### 2. Требования линковщика

Среда выполнения (CRT — C Runtime) и линковщик должны:
1. **Найти** символ `main` в таблице символов
2. **Связать** точку входа с адресом функции `main`
3. **Передать управление** при запуске программы

```
Таблица символов объектного файла:
┌─────────────────────────┐
│ Symbol     │ Linkage   │
├─────────────────────────┤
│ main       │ GLOBAL    │  ← Требуется для точки входа
│ helper     │ LOCAL     │  ← static, не виден снаружи
└─────────────────────────┘
```

### 3. Конфликт линковки

| Аспект | `static` | Требование для `main` |
|--------|----------|----------------------|
| Видимость | Только внутри модуля | Глобальная (external) |
| Экспорт символа | ❌ Нет | ✅ Требуется |
| Доступ из CRT | ❌ Невозможен | ✅ Необходим |
| Точка входа | ❌ Не может быть | ✅ Должна быть |

## Технические последствия

### Символ в таблице символов

При компиляции с `static main`:

```c
// main.c
static int main(void) { return 0; }
```

**nm (Unix/Linux):**
```bash
$ nm main.o
0000000000000000 t main    # 't' = local text (невидим для линковщика)
```

Без `static`:
```bash
$ nm main.o
0000000000000000 T main    # 'T' = global text (видим для линковщика)
```

### Ошибка линковщика

При попытке собрать программу с `static main`:

```bash
$ gcc -static main.c -o program
/usr/bin/ld: warning: cannot find entry symbol _start; defaulting to 0000000000401000
# Или явно:
/usr/bin/ld: undefined reference to `main'
```

Линковщик не может найти `main`, потому что символ имеет внутреннюю линковку.

## Стандарт C

Стандарт C требует, чтобы `main` была **определением** с внешней линковкой:

> «The function called at program startup is named `main`. The implementation declares no prototype for this function. It shall be defined with a return type of `int`...»

Подразумевается:
- **Определение** (не объявление)
- **Внешняя линковка** (по умолчанию для функций)
- **Видимость для среды выполнения**

## Сравнение с другими функциями

| Функция | `static` разрешён | Причина |
|---------|-------------------|---------|
| `main` | ❌ Нет | Требуется внешняя линковка |
| Вспомогательные функции | ✅ Да | Локальное использование |
| Функции в .c файлах | ✅ Да | Инкапсуляция реализации |

## Примеры

### ❌ Неправильно

```c
// main.c
static int main(void) {
    // Линковщик не найдёт этот символ
    return 0;
}
```

### ✅ Правильно

```c
// main.c
int main(void) {
    // Символ экспортируется для линковщика
    return 0;
}

// Вспомогательные функции могут быть static
static void helper(void) {
    // Локальная функция
}
```

## Специфика компиляторов

### GCC/Clang

```bash
$ gcc static_main.c -o program
# Предупреждение или ошибка линковки
```

### MSVC

```
LINK : fatal error LNK1561: entry point must be defined
# Линковщик не может найти main с internal linkage
```

## Вывод

Ограничение на `static` для `main` обусловлено требованиями линковки:
1. Среда выполнения должна видеть символ `main`
2. Линковщик должен связать точку входа с функцией
3. `static` делает символ невидимым для линковщика

## Источники

- [Microsoft: Main function restrictions](https://learn.microsoft.com/ru-ru/cpp/c-language/main-function-and-program-execution?view=msvc-170)
- [cppreference: Main function](https://en.cppreference.com/w/c/language/main_function.html)
- [cppreference: Linkage](https://en.cppreference.com/w/c/language/linkage)

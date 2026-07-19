# str — Строки

**Категория:** [[Типы данных Python|Последовательности]]

## Описание

Неизменяемая последовательность Unicode кодовых точек. Используется для работы с текстом. Является массивом.

## Создание

```python
# Литералы
s1 = 'Одинарные кавычки'
s2 = "Двойные кавычки"
s3 = '''Тройные кавычки
для многострочных строк'''
s4 = """Так тоже можно"""

# Конструктор
s5 = str()          # ''
s6 = str(42)        # '42'
s7 = str(3.14)      # '3.14'

# f-строки (Python 3.6+)
name = "World"
s8 = f"Hello, {name}!"    # 'Hello, World!'
s9 = f"{42 + 8}"          # '50'
```

## Экранирование

| Последовательность | Символ |
|--------------------|--------|
| `\n` | Новая строка |
| `\r` | Возврат каретки |
| `\t` | Табуляция |
| `\\` | Обратный слэш |
| `\'` | Одинарная кавычка |
| `\"` | Двойная кавычка |
| `\xNN` | Символ по hex-коду |
| `\uNNNN` | Unicode символ (16 бит) |
| `\UNNNNNNNN` | Unicode символ (32 бита) |

```python
# Raw-строки (для путей, regex)
path = r"C:\Users\Name\Documents"    # \ не экранируется

# Байтовые строки
b = b"ASCII bytes only"
```

## Операции

| Операция | Синтаксис | Пример | Результат |
|----------|-----------|--------|-----------|
| Конкатенация | `s + t` | `'Hello' + ' ' + 'World'` | `'Hello World'` |
| Повторение | `s * n` | `'-' * 10` | `'----------'` |
| Индексация | `s[i]` | `'abc'[1]` | `'b'` |
| Срез | `s[i:j]` | `'abcde'[1:4]` | `'bcd'` |
| Срез с шагом | `s[i:j:k]` | `'abcde'[::2]` | `'ace'` |
| Вхождение | `x in s` | `'ell' in 'Hello'` | `True` |
| Длина | `len(s)` | `len('Hello')` | `5` |

## Методы строк

### Поиск и замена

| Метод | Описание | Пример |
|-------|----------|--------|
| `find(sub)` | Индекс первого вхождения (или -1) | `'hello'.find('l')` → `2` |
| `rfind(sub)` | Индекс последнего вхождения | `'hello'.rfind('l')` → `3` |
| `index(sub)` | Как find, но ValueError если нет | `'hello'.index('l')` → `2` |
| `rindex(sub)` | Как rfind, но ValueError если нет | `'hello'.rindex('l')` → `3` |
| `count(sub)` | Количество вхождений | `'hello'.count('l')` → `2` |
| `replace(old, new)` | Замена всех вхождений | `'hello'.replace('l', 'x')` → `'hexxo'` |
| `replace(old, new, count)` | Замена первых count вхождений | `'hello'.replace('l', 'x', 1)` → `'hexlo'` |

### Проверка строки

| Метод | Описание | Пример |
|-------|----------|--------|
| `startswith(prefix)` | Начинается с префикса | `'hello'.startswith('he')` → `True` |
| `endswith(suffix)` | Заканчивается суффиксом | `'hello'.endswith('lo')` → `True` |
| `isalnum()` | Только буквы и цифры | `'abc123'.isalnum()` → `True` |
| `isalpha()` | Только буквы | `'abc'.isalpha()` → `True` |
| `isdigit()` | Только цифры | `'123'.isdigit()` → `True` |
| `islower()` | Все буквы в нижнем регистре | `'abc'.islower()` → `True` |
| `isupper()` | Все буквы в верхнем регистре | `'ABC'.isupper()` → `True` |
| `isspace()` | Только пробельные символы | `'   '.isspace()` → `True` |
| `istitle()` | Заголовок (слова с заглавной) | `'Hello World'.istitle()` → `True` |
| `isnumeric()` | Числовой (включая дроби) | `'½'.isnumeric()` → `True` |
| `isdecimal()` | Только десятичные цифры | `'123'.isdecimal()` → `True` |
| `isprintable()` | Все символы печатные | `'hello'.isprintable()` → `True` |
| `isascii()` | Только ASCII | `'hello'.isascii()` → `True` |
| `isidentifier()` | Валидный идентификатор | `'my_var'.isidentifier()` → `True` |

### Регистр

| Метод | Описание | Пример |
|-------|----------|--------|
| `lower()` | В нижний регистр | `'HELLO'.lower()` → `'hello'` |
| `upper()` | В верхний регистр | `'hello'.upper()` → `'HELLO'` |
| `capitalize()` | Первая заглавная | `'hello'.capitalize()` → `'Hello'` |
| `title()` | Заголовок | `'hello world'.title()` → `'Hello World'` |
| `swapcase()` | Сменить регистр | `'Hello'.swapcase()` → `'hELLO'` |
| `casefold()` | Агрессивный lower (для сравнений) | `'Straße'.casefold()` → `'strasse'` |

### Выравнивание и заполнение

| Метод | Описание | Пример |
|-------|----------|--------|
| `ljust(width, fillchar)` | Выровнять влево | `'hi'.ljust(5, '-')` → `'hi---'` |
| `rjust(width, fillchar)` | Выровнять вправо | `'hi'.rjust(5, '-')` → `'---hi'` |
| `center(width, fillchar)` | По центру | `'hi'.center(5, '-')` → `'-hi--'` |
| `zfill(width)` | Заполнить нулями слева | `'42'.zfill(5)` → `'00042'` |

### Разделение и объединение

| Метод | Описание | Пример |
|-------|----------|--------|
| `split(sep)` | Разделить по разделителю | `'a,b,c'.split(',')` → `['a', 'b', 'c']` |
| `rsplit(sep)` | Разделить справа | `'a,b,c'.rsplit(',', 1)` → `['a,b', 'c']` |
| `splitlines()` | По строкам | `'a\nb\nc'.splitlines()` → `['a', 'b', 'c']` |
| `partition(sep)` | Разделить на 3 части | `'a:b:c'.partition(':')` → `('a', ':', 'b:c')` |
| `rpartition(sep)` | Разделить справа | `'a:b:c'.rpartition(':')` → `('a:b', ':', 'c')` |
| `join(iterable)` | Объединить | `'-'.join(['a', 'b', 'c'])` → `'a-b-c'` |

### Очистка

| Метод                  | Описание                       | Пример                               |
| ---------------------- | ------------------------------ | ------------------------------------ |
| `strip(chars)`         | Удалить символы с обеих сторон | `'  hello  '.strip()` → `'hello'`    |
| `lstrip(chars)`        | Удалить слева                  | `'  hello'.lstrip()` → `'hello  '`   |
| `rstrip(chars)`        | Удалить справа                 | `'hello  '.rstrip()` → `'  hello'`   |
| `removeprefix(prefix)` | Удалить префикс (3.9+)         | `'Test'.removeprefix('Te')` → `'st'` |
| `removesuffix(suffix)` | Удалить суффикс (3.9+)         | `'Test'.removesuffix('st')` → `'Te'` |

### Кодирование и перевод

| Метод                 | Описание                 | Пример                                |
| --------------------- | ------------------------ | ------------------------------------- |
| `encode(encoding)`    | Кодировать в байты       | `'привет'.encode('utf-8')` → `b'...'` |
| `translate(table)`    | Применить таблицу замены | `'hello'.translate(table)`            |
| `maketrans(from, to)` | Создать таблицу замены   | `str.maketrans('ae', '13')`           |
| `expandtabs(tabsize)` | Заменить табы пробелами  | `'a\tb'.expandtabs(4)` → `'a   b'`    |

## Форматирование

### f-строки (Python 3.6+)

```python
name = "Alice"
age = 30
pi = 3.14159

f"{name} is {age} years old"           # 'Alice is 30 years old'
f"{pi:.2f}"                            # '3.14' (точность)
f"{pi=}"                               # 'pi=3.14159' (отладка)
f"{name.upper()}"                      # 'ALICE' (выражения)
f"{age:>5}"                            # '   30' (выравнивание)
f"{age:05d}"                           # '00030' (заполнение)
f"{0x2A:x}"                            # '2a' (шестнадцатеричное)
f"{1000000:,}"                         # '1,000,000' (разделитель)
```

### str.format()

```python
"{} {}".format("Hello", "World")           # 'Hello World'
"{0} {1} {0}".format("Hello", "World")     # 'Hello World Hello'
"{name} is {age}".format(name="Alice", age=30)  # 'Alice is 30'

# Форматирование
"{:.2f}".format(3.14159)                   # '3.14'
"{:>10}".format("test")                    # '      test'
"{:05d}".format(42)                        # '00042'
```

### printf-стиль

```python
"%s %d %.2f" % ("Hello", 42, 3.14)    # 'Hello 42 3.14'
```

## Особенности

- **Неизменяемый тип:** все методы создают новые строки
- **Хешируемый:** можно использовать как ключ словаря
- **Unicode:** поддержка всех языков и эмодзи

```python
# Пример с Unicode
emoji = "🐍"
len(emoji)              # 1 (один символ)
emoji.encode('utf-8')   # b'\xf0\x9f\x90\x8d' (4 байта)
```

## Источники
- [Python Docs — str](https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str)
- [Python Docs — String Methods](https://docs.python.org/3/library/stdtypes.html#string-methods)

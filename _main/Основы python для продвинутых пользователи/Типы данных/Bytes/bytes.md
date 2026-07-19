# bytes — Байтовые строки

**Категория:** [[Типы данных Python|Байтовые типы]]

## Описание

Неизменяемая последовательность байтов (целых чисел от 0 до 255).

Используется для работы с бинарными данными и кодирования текста.

## Создание

```python
# Литералы
b1 = b'hello'           # ASCII байты
b2 = b'\x48\x65\x6c\x6c\x6f'  # Hex байты
b3 = b'\110\145\154\154\157'   # Octal байты

# Конструктор
b4 = bytes()            # b'' (пустые байты)
b5 = bytes(5)           # b'\x00\x00\x00\x00\x00' (5 нулевых байт)
b6 = bytes([72, 101, 108, 108, 111])  # b'hello' из списка
b7 = bytes("hello", 'utf-8')  # b'hello' из строки

# Из строки с кодированием
text = "Привет"
b8 = text.encode('utf-8')      # b'\xd0\x9f\xd1\x80...'
b9 = text.encode('cp1251')     # b'\xcf\xf0\xe8...'
```

## Операции

| Операция | Синтаксис | Пример | Результат |
|----------|-----------|--------|-----------|
| Конкатенация | `b1 + b2` | `b'hi' + b'!'` | `b'hi!'` |
| Повторение | `b * n` | `b'ab' * 2` | `b'abab'` |
| Индексация | `b[i]` | `b'abc'[1]` | `98` (int!) |
| Срез | `b[i:j]` | `b'abc'[1:]` | `b'bc'` |
| Вхождение | `x in b` | `98 in b'abc'` | `True` |
| Длина | `len(b)` | `len(b'abc')` | `3` |

**Важно:** Индексация возвращает `int`, а не `bytes`!

## Методы

### Кодирование и декодирование

| Метод | Описание | Пример |
|-------|----------|--------|
| `decode(encoding, errors)` | Декодировать в str | `b'hello'.decode('utf-8')` |

```python
b = b'Hello, World!'
b.decode('utf-8')         # 'Hello, World!'

# С обработкой ошибок
b'\xff'.decode('utf-8', errors='ignore')     # ''
b'\xff'.decode('utf-8', errors='replace')    # ''
b'\xff'.decode('utf-8', errors='backslashreplace')  # '\\xff'
```

### Шестнадцатеричное представление

| Метод | Описание | Пример |
|-------|----------|--------|
| `hex([sep[, bytes_per_sep]])` | Hex строка | `b'\x00\xff'.hex()` |
| `fromhex(string)` | Создать из hex | `bytes.fromhex('00ff')` |

```python
b = b'\x00\xff'
b.hex()                 # '00ff'
b.hex(':')              # '00:ff'
b.hex(':', 1)           # '00:ff' (разделитель между байтами)

bytes.fromhex('00ff')   # b'\x00\xff'
bytes.fromhex('00 ff')  # b'\x00\xff' (пробелы игнорируются)
```

### Поиск и проверка

| Метод | Описание | Пример |
|-------|----------|--------|
| `find(sub[, start, end])` | Найти подпоследовательность | `b'hello'.find(b'll')` |
| `rfind(sub[, start, end])` | Найти справа | `b'hello'.rfind(b'l')` |
| `index(sub[, start, end])` | Найти (ValueError если нет) | `b'hello'.index(b'll')` |
| `count(sub[, start, end])` | Количество вхождений | `b'hello'.count(b'l')` |
| `startswith(prefix)` | Проверка префикса | `b'hello'.startswith(b'he')` |
| `endswith(suffix)` | Проверка суффикса | `b'hello'.endswith(b'lo')` |

```python
b = b'hello world'
b.find(b'world')          # 6
b.find(b'xyz')            # -1
b.count(b'l')             # 3
b.startswith(b'hello')    # True
b.endswith(b'world')      # True
```

### Разделение и объединение

| Метод | Описание | Пример |
|-------|----------|--------|
| `split([sep[, maxsplit]])` | Разделить | `b'a,b,c'.split(b',')` |
| `rsplit([sep[, maxsplit]])` | Разделить справа | `b'a,b,c'.rsplit(b',', 1)` |
| `partition(sep)` | Разделить на 3 части | `b'a:b'.partition(b':')` |
| `rpartition(sep)` | Разделить справа | `b'a:b'.rpartition(b':')` |
| `join(iterable)` | Объединить | `b'-'.join([b'a', b'b'])` |

```python
b'a,b,c'.split(b',')          # [b'a', b'b', b'c']
b'a,b,c'.split(b',', 1)       # [b'a', b'b,c']
b'-'.join([b'hello', b'world'])  # b'hello-world'
```

### Очистка

| Метод | Описание | Пример |
|-------|----------|--------|
| `strip([chars])` | Удалить с обеих сторон | `b'  hi  '.strip()` |
| `lstrip([chars])` | Удалить слева | `b'  hi'.lstrip()` |
| `rstrip([chars])` | Удалить справа | `b'hi  '.rstrip()` |
| `removeprefix(prefix)` | Удалить префикс (3.9+) | `b'test'.removeprefix(b'te')` |
| `removesuffix(suffix)` | Удалить суффикс (3.9+) | `b'test'.removesuffix(b'st')` |

```python
b'  hello  '.strip()        # b'hello'
b'\r\nhello\r\n'.strip()    # b'hello'
b'www.example.com'.removeprefix(b'www.')  # b'example.com'
```

### Замена и перевод

| Метод | Описание | Пример |
|-------|----------|--------|
| `replace(old, new[, count])` | Замена | `b'hello'.replace(b'l', b'x')` |
| `translate(table)` | Применить таблицу замены | `b'hello'.translate(table)` |
| `maketrans(from, to)` | Создать таблицу замены | `bytes.maketrans(b'ae', b'13')` |

```python
b'hello'.replace(b'l', b'x')           # b'hexxo'
b'hello'.replace(b'l', b'x', 1)        # b'hexlo'

table = bytes.maketrans(b'aeiou', b'12345')
b'hello'.translate(table)              # b'h2ll4'
```

### Проверка содержимого

| Метод | Описание | Пример |
|-------|----------|--------|
| `isalnum()` | Только буквы и цифры | `b'abc123'.isalnum()` |
| `isalpha()` | Только буквы | `b'abc'.isalpha()` |
| `isdigit()` | Только цифры | `b'123'.isdigit()` |
| `islower()` | Все буквы в нижнем регистре | `b'abc'.islower()` |
| `isupper()` | Все буквы в верхнем регистре | `b'ABC'.isupper()` |
| `isspace()` | Только пробельные | `b'   '.isspace()` |
| `isascii()` | Только ASCII | `b'hello'.isascii()` |

```python
b'hello'.isalpha()        # True
b'hello123'.isalnum()     # True
b'123'.isdigit()          # True
b'HELLO'.isupper()        # True
b'hello'.islower()        # True
```

### Регистр

| Метод | Описание | Пример |
|-------|----------|--------|
| `lower()` | В нижний регистр | `b'HELLO'.lower()` |
| `upper()` | В верхний регистр | `b'hello'.upper()` |
| `swapcase()` | Сменить регистр | `b'Hello'.swapcase()` |
| `capitalize()` | Первая заглавная | `b'hello'.capitalize()` |
| `title()` | Заголовок | `b'hello world'.title()` |

```python
b'Hello'.upper()          # b'HELLO'
b'Hello'.lower()          # b'hello'
b'Hello World'.title()    # b'Hello World'
```

### Выравнивание

| Метод | Описание | Пример |
|-------|----------|--------|
| `ljust(width, fillchar)` | Выровнять влево | `b'hi'.ljust(5, b'-')` |
| `rjust(width, fillchar)` | Выровнять вправо | `b'hi'.rjust(5, b'-')` |
| `center(width, fillchar)` | По центру | `b'hi'.center(5, b'-')` |
| `zfill(width)` | Заполнить нулями | `b'42'.zfill(5)` |

```python
b'42'.zfill(5)            # b'00042'
b'hi'.center(7, b'*')     # b'**hi***'
```

## Особенности

- **Неизменяемый тип**
- **Хешируемый:** можно использовать как ключ словаря
- **Элементы — int от 0 до 255**
- **Только ASCII в литералах:** `\xNN` для других байтов

```python
# Индексация возвращает int
b = b'hello'
b[0]          # 104 (int)
b[0:1]        # b'h' (bytes)

# Для итерации по байтам
for byte in b'hello':
    print(byte)  # 104, 101, 108, 108, 111
```

## Источники
- [Python Docs — bytes](https://docs.python.org/3/library/stdtypes.html#bytes-objects)

# bool — Булев тип

**Категория:** [[Типы данных Python|Булев тип]]

## Описание

Логический тип с двумя возможными значениями: `True` и `False`.

Является подтипом `int`: `True == 1`, `False == 0`.

## Создание

```python
# Литералы
t = True
f = False

# Конструктор
bool()              # False
bool(1)             # True
bool(0)             # False
bool("hello")       # True
bool("")            # False
```

## Логические операции

| Операция | Синтаксис | Описание | Пример |
|----------|-----------|----------|--------|
| И | `x and y` | x если False, иначе y | `True and False` → `False` |
| ИЛИ | `x or y` | x если True, иначе y | `True or False` → `True` |
| НЕ | `not x` | Инверсия | `not True` → `False` |

### Таблицы истинности

**AND (и):**
| x | y | x and y |
|---|---|---------|
| T | T | T |
| T | F | F |
| F | T | F |
| F | F | F |

**OR (или):**
| x | y | x or y |
|---|---|--------|
| T | T | T |
| T | F | T |
| F | T | T |
| F | F | F |

**NOT (не):**
| x | not x |
|---|-------|
| T | F |
| F | T |

## Примеры логических операций

```python
# AND
True and True       # True
True and False      # False
False and True      # False
False and False     # False

# OR
True or True        # True
True or False       # True
False or True       # True
False or False      # False

# NOT
not True            # False
not False           # True

# Комбинированные
(not False) and True    # True
True or (False and True)  # True
```

## Логические операции с не-булевыми значениями

Возвращают одно из операндов (ленивое вычисление):

```python
# and возвращает первый False или последний True
5 and 3         # 3
5 and 0         # 0
0 and 5         # 0
"" and "hello"  # ""

# or возвращает первый True или последний False
5 or 3          # 5
0 or 3          # 3
"" or "hello"   # "hello"
[] or [1, 2]    # [1, 2]

# Практическое применение
name = user_input or "Anonymous"  # Значение по умолчанию
config = settings.get('debug') or False
```

## Проверка истинности (Truth Value Testing)

Любой объект можно проверить на истинность в булевом контексте.

### Ложные значения (False)

```python
# Константы
None
False

# Числа
0           # int
0.0         # float
0j          # complex
Decimal(0)  # decimal
Fraction(0, 1)  # fractions

# Последовательности и отображения
''          # пустая строка
()          # пустой кортеж
[]          # пустой список
{}          # пустой словарь
set()       # пустое множество
range(0)    # пустой диапазон

# Пользовательские классы
# Если __bool__() возвращает False или __len__() возвращает 0
```

### Истинные значения (True)

```python
# Всё остальное
True
1
3.14
"hello"
[1, 2, 3]
{'key': 'value'}
```

## Проверка истинности

```python
# Явная проверка
if x:
    pass

# Эквивалентно
if bool(x):
    pass

# Отрицание
if not x:
    pass
```

## Сравнение и bool

```python
# Операторы сравнения возвращают bool
5 > 3         # True
5 < 3         # False
5 == 5        # True
5 != 3        # True
5 >= 5        # True
5 <= 4        # False

# Цепочки сравнений
1 < 2 < 3     # True
1 < 3 > 2     # True
1 < 2 < 1     # False
```

## bool как подтип int

```python
# bool наследует от int
isinstance(True, int)     # True
isinstance(False, int)    # True

# Арифметика
True + 1          # 2
False * 10        # 0
True / 2          # 0.5

# Сравнение
True == 1         # True
False == 0        # True
True == 2         # False

# Но:
True is 1         # False (разные объекты)
```

## Методы bool

Наследует методы `int`, но использовать их не рекомендуется:

```python
True.bit_length()     # 1
False.bit_length()    # 0
True.to_bytes(1, 'big')  # b'\x01'
```

## Практическое применение

### Условные выражения

```python
# Тернарный оператор
status = "active" if is_active else "inactive"

# Вместо
if is_active:
    status = "active"
else:
    status = "inactive"
```

### Проверка нескольких условий

```python
# Все условия должны быть истинны
if 0 < x < 10 and y > 0 and z is not None:
    process(x, y, z)

# Хотя бы одно условие истинно
if day == "Saturday" or day == "Sunday":
    rest()
```

### Ленивое вычисление

```python
# Короткое замыкание (short-circuit evaluation)

# and: если первый операнд False, второй не вычисляется
if user and user.is_authenticated():
    show_dashboard()

# or: если первый операнд True, второй не вычисляется
cache = get_cached() or compute_expensive()
```

### Фильтрация

```python
# Оставить только истинные значения
values = [0, 1, '', 'hello', None, [], [1, 2]]
truthy = [v for v in values if v]
# [1, 'hello', [1, 2]]
```

## Особенности

- **Неизменяемый тип**
- **Хешируемый:** можно использовать как ключ словаря
- **Подтип int:** наследует все методы int
- **Всего два значения:** `True` и `False`

```python
# Константы в builtins
True    # Всегда истинно
False   # Всегда ложно

# В Python 3 нельзя переопределить
# True = False  # SyntaxError!
```

## Источники
- [Python Docs — bool](https://docs.python.org/3/library/stdtypes.html#truth-value-testing)
- [Python Docs — Boolean Operations](https://docs.python.org/3/library/stdtypes.html#boolean-operations-and-or-not)

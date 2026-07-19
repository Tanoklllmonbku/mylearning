# set — Множества

**Категория:** [[Типы данных Python|Множества]]

## Описание

Изменяемая неупорядоченная коллекция уникальных хешируемых элементов.

Реализован как хеш-таблица (только ключи, без значений).

## Создание

```python
# Литералы
s1 = {1, 2, 3}
s2 = {1, 2, 2, 3}         # {1, 2, 3} — дубликаты удаляются

# Конструктор
s3 = set()                # Пустое множество
s4 = set([1, 2, 3, 2])    # {1, 2, 3}
s5 = set("hello")         # {'h', 'e', 'l', 'o'}

# Set comprehension
squares = {x**2 for x in range(5)}    # {0, 1, 4, 9, 16}
evens = {x for x in range(10) if x % 2 == 0}  # {0, 2, 4, 6, 8}
```

**Важно:** `{}` — это пустой словарь, а не множество!

## Операции над множествами

| Операция | Синтаксис | Метод | Пример |
|----------|-----------|-------|--------|
| Объединение | `s1 \| s2` | `s1.union(s2)` | `{1,2} \| {2,3}` → `{1,2,3}` |
| Пересечение | `s1 & s2` | `s1.intersection(s2)` | `{1,2} & {2,3}` → `{2}` |
| Разность | `s1 - s2` | `s1.difference(s2)` | `{1,2} - {2,3}` → `{1}` |
| Симметрическая разность | `s1 ^ s2` | `s1.symmetric_difference(s2)` | `{1,2} ^ {2,3}` → `{1,3}` |
| Подмножество | `s1 <= s2` | `s1.issubset(s2)` | `{1} <= {1,2}` → `True` |
| Надмножество | `s1 >= s2` | `s1.issuperset(s2)` | `{1,2} >= {1}` → `True` |
| Собственное подмножество | `s1 < s2` | — | `{1} < {1,2}` → `True` |
| Собственное надмножество | `s1 > s2` | — | `{1,2} > {1}` → `True` |

## Методы

### Добавление и удаление

| Метод | Описание | Пример |
|-------|----------|--------|
| `add(x)` | Добавить элемент | `s.add(4)` |
| `remove(x)` | Удалить элемент (KeyError если нет) | `s.remove(4)` |
| `discard(x)` | Удалить элемент (без ошибки) | `s.discard(4)` |
| `pop()` | Удалить и вернуть произвольный | `s.pop()` |
| `clear()` | Очистить множество | `s.clear()` |

```python
s = {1, 2, 3}

s.add(4)                # {1, 2, 3, 4}
s.remove(2)             # {1, 3, 4}
s.remove(99)            # KeyError!
s.discard(99)           # Ничего не происходит
s.pop()                 # Удаляет произвольный элемент
s.clear()               # set()
```

### Операции на месте

| Метод | Описание | Пример |
|-------|----------|--------|
| `update(*others)` | Объединение | `s1.update(s2, s3)` |
| `intersection_update(*others)` | Пересечение | `s1.intersection_update(s2)` |
| `difference_update(*others)` | Разность | `s1.difference_update(s2)` |
| `symmetric_difference_update(other)` | Симметрическая разность | `s1.symmetric_difference_update(s2)` |

```python
s1 = {1, 2, 3}
s2 = {2, 3, 4}

s1.update(s2)                      # {1, 2, 3, 4}
s1 = {1, 2, 3}
s1.intersection_update(s2)         # {2, 3}
s1 = {1, 2, 3}
s1.difference_update(s2)           # {1}
s1 = {1, 2, 3}
s1.symmetric_difference_update(s2) # {1, 4}
```

### Проверки

| Метод | Описание | Пример |
|-------|----------|--------|
| `isdisjoint(other)` | Нет общих элементов | `{1}.isdisjoint({2})` → `True` |
| `issubset(other)` | Подмножество | `{1}.issubset({1,2})` → `True` |
| `issuperset(other)` | Надмножество | `{1,2}.issuperset({1})` → `True` |

```python
{1, 2}.isdisjoint({3, 4})     # True
{1, 2}.isdisjoint({2, 3})     # False

{1, 2}.issubset({1, 2, 3})    # True
{1, 2, 3}.issuperset({1, 2})  # True
```

### Копирование

| Метод | Описание | Пример |
|-------|----------|--------|
| `copy()` | Поверхностная копия | `s.copy()` |

```python
s1 = {1, 2, 3}
s2 = s1.copy()
s2.add(4)
s1    # {1, 2, 3} — не изменилось
```

## Примеры использования

### Удаление дубликатов

```python
lst = [1, 2, 2, 3, 3, 3]
unique = list(set(lst))    # [1, 2, 3]
```

### Проверка вхождения (O(1))

```python
# Множество быстрее списка для проверок
allowed = {'admin', 'user', 'guest'}

if role in allowed:    # O(1)
    grant_access()

# vs список: O(n)
allowed_list = ['admin', 'user', 'guest']
if role in allowed_list:  # O(n)
    grant_access()
```

### Поиск общих элементов

```python
friends_alice = {'Bob', 'Charlie', 'David'}
friends_bob = {'Charlie', 'David', 'Eve'}

# Общие друзья
common = friends_alice & friends_bob    # {'Charlie', 'David'}

# Все друзья
all_friends = friends_alice | friends_bob  # {'Bob', 'Charlie', 'David', 'Eve'}

# Только друзья Alice
only_alice = friends_alice - friends_bob   # {'Bob'}
```

### Фильтрация

```python
# Оставить только уникальные элементы с условием
data = [1, 2, 2, 3, 3, 3, 4]
unique_evens = {x for x in data if x % 2 == 0}  # {2, 4}
```

## Особенности

- **Изменяемый тип**
- **Не хешируемый:** нельзя использовать как ключ словаря
- **Элементы должны быть хешируемыми**
- **Неупорядоченный:** порядок элементов не гарантируется
- **O(1) операции:** добавление, удаление, проверка вхождения

```python
# Элементы должны быть хешируемыми
s = {1, 2, 'three', (4, 5)}
# s = {[1, 2]}  # TypeError!

# Порядок не гарантируется (но в Python 3.7+ сохраняется порядок вставки)
s = {3, 1, 2}
list(s)    # Может быть [3, 1, 2] или другой порядок
```

## Источники
- [Python Docs — set](https://docs.python.org/3/library/stdtypes.html#set-types-set-frozenset)

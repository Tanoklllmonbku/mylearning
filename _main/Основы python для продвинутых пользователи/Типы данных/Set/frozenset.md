# frozenset — Неизменяемые множества

**Категория:** [[Типы данных Python|Множества]]

## Описание

Неизменяемая версия `set`. Может быть ключом словаря и элементом другого множества.

## Создание

```python
# Конструктор
fs1 = frozenset()                    # Пустое frozenset
fs2 = frozenset([1, 2, 3, 2])        # frozenset({1, 2, 3})
fs3 = frozenset("hello")             # frozenset({'h', 'e', 'l', 'o'})
fs4 = frozenset({1, 2, 3})           # Из множества

# frozenset comprehension (Python 3.9+)
# fs5 = frozenset({x**2 for x in range(5)})
```

**Важно:** Нет литерального синтаксиса для `frozenset` (в отличие от `set`).

## Операции

Все операции `set`, которые не изменяют множество:

| Операция | Синтаксис | Метод | Пример |
|----------|-----------|-------|--------|
| Объединение | `fs1 \| fs2` | `fs1.union(fs2)` | `{1,2} \| {2,3}` → `{1,2,3}` |
| Пересечение | `fs1 & fs2` | `fs1.intersection(fs2)` | `{1,2} & {2,3}` → `{2}` |
| Разность | `fs1 - fs2` | `fs1.difference(fs2)` | `{1,2} - {2,3}` → `{1}` |
| Симметрическая разность | `fs1 ^ fs2` | `fs1.symmetric_difference(fs2)` | `{1,2} ^ {2,3}` → `{1,3}` |
| Подмножество | `fs1 <= fs2` | `fs1.issubset(fs2)` | `{1} <= {1,2}` → `True` |
| Надмножество | `fs1 >= fs2` | `fs1.issuperset(fs2)` | `{1,2} >= {1}` → `True` |

## Методы

**Поддерживаются (возвращают новый frozenset):**
- `copy()` — копия
- `union(*others)` — объединение
- `intersection(*others)` — пересечение
- `difference(*others)` — разность
- `symmetric_difference(other)` — симметрическая разность
- `isdisjoint(other)` — проверка на непересекаемость
- `issubset(other)` — подмножество
- `issuperset(other)` — надмножество

**Не поддерживаются (изменяющие):**
- `add()`, `remove()`, `discard()`, `pop()`, `clear()`
- `update()`, `intersection_update()`, `difference_update()`, `symmetric_difference_update()`

```python
fs = frozenset([1, 2, 3])

fs.union([3, 4])              # frozenset({1, 2, 3, 4})
fs.intersection([2, 3, 4])    # frozenset({2, 3})
fs.difference([2, 3])         # frozenset({1})

# fs.add(4)                   # AttributeError!
```

## frozenset как ключ словаря

```python
# frozenset хешируемый — можно использовать как ключ
vowels = frozenset('aeiou')
consonants = frozenset('bcdfg')

letter_types = {
    vowels: "Гласные",
    consonants: "Согласные",
}

letter_types[frozenset('aeiou')]    # "Гласные"
```

## frozenset как элемент множества

```python
# Обычное множество не может содержать другое множество
# s = { {1, 2}, {3, 4} }  # TypeError!

# Но может содержать frozenset
s = {frozenset([1, 2]), frozenset([3, 4])}
# {frozenset({1, 2}), frozenset({3, 4})}

# Множество множеств
set_of_sets = {
    frozenset([1, 2]),
    frozenset([2, 3]),
    frozenset([3, 4]),
}
```

## Преобразование между set и frozenset

```python
s = {1, 2, 3}
fs = frozenset(s)      # set → frozenset

s2 = set(fs)           # frozenset → set
s2.add(4)              # Теперь можно изменять
```

## Примеры использования

### Ключи для графов

```python
# Неориентированный граф (рёбра без порядка)
edges = {
    frozenset(['A', 'B']): 5,
    frozenset(['B', 'C']): 3,
    frozenset(['A', 'C']): 7,
}

# Доступ к весу ребра (порядок не важен)
edges[frozenset(['B', 'A'])]    # 5
```

### Уникальные комбинации

```python
# Найти уникальные пары
pairs = [
    frozenset([1, 2]),
    frozenset([2, 1]),  # То же самое!
    frozenset([3, 4]),
]

unique_pairs = set(pairs)
# {frozenset({1, 2}), frozenset({3, 4})}
```

### Константы

```python
# Неизменяемые константы множеств
VOWELS = frozenset('aeiou')
CONSONANTS = frozenset('bcdfghjklmnpqrstvwxyz')

def is_vowel(letter):
    return letter.lower() in VOWELS
```

## Особенности

- **Неизменяемый тип:** нельзя изменить после создания
- **Хешируемый:** можно использовать как ключ словаря
- **Элементы должны быть хешируемыми**
- **Неупорядоченный:** порядок элементов не гарантируется

```python
# Хешируемость
fs = frozenset([1, 2, 3])
hash(fs)    # Работает!

s = {1, 2, 3}
# hash(s)   # TypeError!
```

## Сравнение set и frozenset

| Характеристика | set | frozenset |
|----------------|-----|-----------|
| Изменяемость | Да | Нет |
| Хешируемый | Нет | Да |
| Можно как ключ | Нет | Да |
| Можно как элемент set | Нет | Да |
| Производительность | Быстрее для изменений | Быстрее для чтения |

## Источники
- [Python Docs — frozenset](https://docs.python.org/3/library/stdtypes.html#set-types-set-frozenset)

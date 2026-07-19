# bytearray — Массивы байтов

**Категория:** [[Типы данных Python|Байтовые типы]]

## Описание

Изменяемая версия `bytes`. Последовательность байтов, которую можно модифицировать.

## Создание

```python
# Конструктор
ba1 = bytearray()                    # bytearray(b'')
ba2 = bytearray(5)                   # bytearray(b'\x00\x00\x00\x00\x00')
ba3 = bytearray([72, 101, 108, 108, 111])  # bytearray(b'hello')
ba4 = bytearray(b'hello')            # bytearray(b'hello') из bytes
ba5 = bytearray("hello", 'utf-8')    # bytearray(b'hello') из строки

# Из итерируемого
ba6 = bytearray(range(5))            # bytearray(b'\x00\x01\x02\x03\x04')
```

**Важно:** Нет литерального синтаксиса для `bytearray`.

## Операции

| Операция | Синтаксис | Пример | Результат |
|----------|-----------|--------|-----------|
| Конкатенация | `ba1 + ba2` | `ba'hi' + ba'!'` | `bytearray(b'hi!')` |
| Повторение | `ba * n` | `ba'ab' * 2` | `bytearray(b'abab')` |
| Индексация | `ba[i]` | `ba'abc'[1]` | `98` (int!) |
| Присваивание | `ba[i] = x` | `ba[0] = 65` | Изменяет байт |
| Срез | `ba[i:j]` | `ba'abc'[1:]` | `bytearray(b'bc')` |
| Присваивание среза | `ba[i:j] = x` | `ba[0:2] = b'XY'` | Заменяет срез |
| Вхождение | `x in ba` | `98 in ba'abc'` | `True` |
| Длина | `len(ba)` | `len(ba'abc')` | `3` |

## Методы

Все методы `bytes` + изменяющие методы:

### Изменяющие методы

| Метод | Описание | Пример |
|-------|----------|--------|
| `append(x)` | Добавить байт в конец | `ba.append(65)` |
| `extend(iterable)` | Расширить элементами | `ba.extend([66, 67])` |
| `insert(i, x)` | Вставить байт по индексу | `ba.insert(1, 65)` |
| `remove(x)` | Удалить первое вхождение | `ba.remove(65)` |
| `pop([i])` | Удалить и вернуть байт | `ba.pop()` |
| `clear()` | Очистить | `ba.clear()` |
| `reverse()` | Развернуть на месте | `ba.reverse()` |

```python
ba = bytearray(b'hello')

ba.append(33)           # bytearray(b'hello!')
ba.extend([63, 64])     # bytearray(b'hello!@?')
ba.insert(0, 72)        # bytearray(b'Hhello!@?')
ba.remove(108)          # Удаляет первое 'l'
ba.pop()                # Возвращает 64, удаляет '?'
ba.pop(0)               # Возвращает 72, удаляет 'H'
ba.clear()              # bytearray(b'')

ba = bytearray(b'abc')
ba.reverse()            # bytearray(b'cba')
```

### Присваивание по индексу и срезу

```python
ba = bytearray(b'hello')

# Изменение байта по индексу
ba[0] = 72              # bytearray(b'Hello')
ba[1] = ord('e')        # bytearray(b'Hello')

# Изменение среза
ba[1:4] = b'ELL'        # bytearray(b'HELLo')
ba[0:2] = [87, 79]      # bytearray(b'WOLLo')

# Удаление через срез
ba = bytearray(b'hello')
ba[1:3] = b''           # bytearray(b'heo')

# Вставка через срез
ba = bytearray(b'heo')
ba[2:2] = b'll'         # bytearray(b'hello')
```

### Методы от bytes (возвращают новый bytearray или int)

```python
ba = bytearray(b'  Hello  ')

ba.strip()              # bytearray(b'Hello')
ba.upper()              # bytearray(b'  HELLO  ')
ba.replace(b'l', b'L')  # bytearray(b'  HeLLo  ')
ba.find(b'll')          # 2
ba.count(b'l')          # 2
ba.startswith(b'  H')   # True
```

### Декодирование

```python
ba = bytearray(b'Hello, World!')
ba.decode('utf-8')      # 'Hello, World!'
```

## bytearray vs bytes

| Характеристика | bytes | bytearray |
|----------------|-------|-----------|
| Изменяемость | Нет | Да |
| Хешируемый | Да | Нет |
| Можно как ключ dict | Да | Нет |
| Производительность | Быстрее для чтения | Быстрее для изменений |
| Использование | Константы, ключи | Буферы, модификация |

```python
# bytes — для неизменяемых данных
HEADER = b'\x89PNG\r\n\x1a\n'

# bytearray — для модификации
buffer = bytearray(1024)
buffer[0:4] = b'\x89PNG'
```

## Примеры использования

### Работа с бинарными файлами

```python
# Чтение и модификация файла
with open('file.bin', 'rb') as f:
    data = bytearray(f.read())

# Модификация
data[0] = 0x42  # Изменить первый байт
data.extend(b'\x00\x00')  # Добавить байты

# Запись обратно
with open('file.bin', 'wb') as f:
    f.write(data)
```

### Построение буфера

```python
# Эффективное построение байтовых данных
buffer = bytearray()

for i in range(100):
    buffer.append(i & 0xFF)

# Или
buffer = bytearray()
buffer.extend(range(100))
```

### Сетевые пакеты

```python
# Создание пакета
packet = bytearray(10)
packet[0] = 0xAA          # Sync byte
packet[1] = 0x01          # Command
packet[2:4] = b'\x00\x10' # Length
packet[4:8] = data        # Payload
packet[8] = checksum      # Checksum

# Парсинг пакета
sync = packet[0]
command = packet[1]
length = int.from_bytes(packet[2:4], 'big')
payload = packet[4:4+length]
```

### Кодирование/декодирование

```python
# Постепенное построение строки
ba = bytearray()
ba.extend("Привет".encode('utf-8'))
ba.extend(b', ')
ba.extend("World".encode('utf-8'))

result = ba.decode('utf-8')  # 'Привет, World'
```

## Особенности

- **Изменяемый тип**
- **Не хешируемый:** нельзя использовать как ключ словаря
- **Элементы — int от 0 до 255**
- **Поддерживает буферный протокол**

```python
# Проверка диапазона
ba = bytearray(5)
ba[0] = 255         # OK
# ba[0] = 256       # ValueError!
# ba[0] = -1        # ValueError!
```

## Источники
- [Python Docs — bytearray](https://docs.python.org/3/library/stdtypes.html#bytearray-objects)

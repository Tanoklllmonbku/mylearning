# memoryview — Представление памяти

**Категория:** [[Типы данных Python|Байтовые типы]]

## Описание

Объект для доступа к внутренним данным объекта, поддерживающего буферный протокол, без копирования памяти.

Позволяет эффективно работать с большими объёмами бинарных данных.

## Создание

```python
# Конструктор (только для объектов с буферным протоколом)
data = b'hello world'
mv = memoryview(data)

# С bytearray (изменяемый)
ba = bytearray(b'hello world')
mv = memoryview(ba)

# С bytes (неизменяемый)
b = b'hello world'
mv = memoryview(b)
```

**Поддерживаемые типы:** `bytes`, `bytearray`, `array.array`, `numpy.ndarray`

## Основные операции

### Индексация и срезы

```python
data = bytearray(b'hello world')
mv = memoryview(data)

mv[0]           # 104 (int)
mv[0] = 72      # Изменяет исходные данные!
mv[0:5]         # memoryview(b'Hello')
mv[::2]         # memoryview(b'Hlo ol')
```

**Важно:** Срезы `memoryview` не копируют данные, а создают новое представление!

### Атрибуты

```python
data = bytearray(b'hello world')
mv = memoryview(data)

mv.obj          # Исходный объект (bytearray)
mv.nbytes       # Количество байтов (11)
mv.ndim         # Количество измерений (1)
mv.shape        # Форма ((11,))
mv.strides      # Шаг (1,)
mv.c_contiguous # C-непрерывность (True)
mv.f_contiguous # Fortran-непрерывность (True)
mv.format       # Формат элемента ('B' для байтов)
mv.itemsize     # Размер элемента (1)
```

## Методы

### tobytes() и cast()

| Метод | Описание | Пример |
|-------|----------|--------|
| `tobytes()` | Копировать данные в bytes | `mv.tobytes()` |
| `tolist()` | Конвертировать в список | `mv.tolist()` |
| `cast(format)` | Изменить интерпретацию | `mv.cast('H')` |
| `release()` | Освободить буфер | `mv.release()` |

```python
data = bytearray(b'\x00\x01\x02\x03\x04\x05')
mv = memoryview(data)

mv.tobytes()          # b'\x00\x01\x02\x03\x04\x05'
mv.tolist()           # [0, 1, 2, 3, 4, 5]

# Изменение интерпретации (2 байта → 1 uint16)
mv2 = mv.cast('H')    # 'H' = unsigned short (2 байта)
mv2[0]                # 256 (0x0100 в little-endian)
```

### Срезы без копирования

```python
data = bytearray(1000000)  # 1 MB
mv = memoryview(data)

# Срез без копирования памяти!
sub_mv = mv[1000:2000]     # Представление 1000 байт
sub_mv2 = mv[5000:6000]    # Ещё одно представление

# Изменение через представление
sub_mv[0] = 255            # Изменяет data[1000]!

# Проверка: данные в исходном объекте изменены
data[1000]                 # 255
```

## Примеры использования

### Эффективная работа с большими данными

```python
# Без memoryview — копирование при каждом срезе
data = bytearray(10**8)  # 100 MB
chunk = data[10000:20000]  # Копирование 10 KB!

# С memoryview — без копирования
mv = memoryview(data)
chunk_mv = mv[10000:20000]  # Только представление!
```

### Обработка сетевых пакетов

```python
def parse_packet(data):
    mv = memoryview(data)
    
    # Заголовок (первые 10 байт)
    header = mv[0:10]
    
    # Длина payload (байты 2-4)
    length = int.from_bytes(mv[2:4], 'big')
    
    # Payload
    payload = mv[10:10+length]
    
    # Checksum (последние 2 байта)
    checksum = mv[-2:]
    
    return header, payload, checksum

# Без копирования больших данных
packet = bytearray(10000)
parse_packet(packet)
```

### Изменение данных на месте

```python
# Шифрование/дешифрование на месте
def xor_encrypt(data, key):
    mv = memoryview(data)
    key_mv = memoryview(key)
    key_len = len(key)
    
    for i in range(len(mv)):
        mv[i] ^= key_mv[i % key_len]

data = bytearray(b'Secret message!')
key = b'KEY'
xor_encrypt(data, key)      # data изменена
xor_encrypt(data, key)      # data восстановлена
```

### Работа с многомерными данными

```python
import array

# Двумерный массив (матрица 3x4)
data = array.array('i', range(12))  # 12 int32
mv = memoryview(data).cast('i', shape=(3, 4))

mv.shape        # (3, 4)
mv[0, 0]        # 0
mv[1, 2]        # 6
mv[0]           # memoryview первого ряда

# Срез по строкам
mv[1:, :]       # Последние 2 строки
```

### Нулевое копирование между буферами

```python
# Копирование из одного буфера в другой
src = bytearray(b'Hello, World!')
dst = bytearray(13)

mv_src = memoryview(src)
mv_dst = memoryview(dst)

# Прямое копирование без создания временных объектов
mv_dst[:] = mv_src[:]

dst    # bytearray(b'Hello, World!')
```

## Особенности

- **Не копирует данные:** срезы — это представления
- **Изменяемость зависит от исходного объекта:**
  - `bytearray` → изменяемый `memoryview`
  - `bytes` → неизменяемый `memoryview`
- **Эффективен для больших данных**
- **Поддерживает многомерные срезы**

```python
# Проверка изменяемости
mv = memoryview(b'hello')    # bytes
# mv[0] = 72                 # TypeError!

mv = memoryview(bytearray(b'hello'))
mv[0] = 72                   # OK
```

## Производительность

```python
import timeit

# Сравнение производительности
data = bytearray(10**6)

# Копирование через срез
timeit.timeit(lambda: data[1000:2000], number=10000)

# Представление через memoryview
mv = memoryview(data)
timeit.timeit(lambda: mv[1000:2000], number=10000)

# memoryview значительно быстрее для больших срезов
```

## Источники
- [Python Docs — memoryview](https://docs.python.org/3/library/stdtypes.html#memoryview-objects)
- [Python Buffer Protocol](https://docs.python.org/3/c-api/buffer.html)

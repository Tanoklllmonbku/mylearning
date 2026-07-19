# Ключевые слова C

Ключевые слова — зарезервированные идентификаторы языка, имеющие специальное значение. Нельзя использовать как имена переменных или функций.

## Кратко

Ключевые слова — это **встроенный словарь** языка C. Они определяют:
- типы данных (`int`, `char`, `float`)
- модификаторы (`const`, `volatile`, `static`)
- управляющие конструкции (`if`, `for`, `while`)
- операции (`sizeof`, `return`)

Всего в C **32 ключевых слова** (C99/C11).

## Полный список

```
auto       double     int        struct
break      else       long       switch
case       enum       register   typedef
char       extern     return     union
const      float      short      unsigned
continue   for        signed     void
default    goto       sizeof     volatile
do         if         static     while

// C99
inline     restrict   _Bool      _Complex    _Imaginary

// C11
_Alignas   _Alignof   _Atomic    _Generic
_Noreturn  _Static_assert _Thread_local
```

## Пример использования

```c
static const int MAX = 100;

if (x > MAX) {
    return sizeof(x);
} else {
    return 0;
}
```

## Источники
- [[Книжки, ссылки, материалы, статьи.#Ключевые слова C]]

## Подробно о каждом ключевом слове

См. заметки в папке `Ключевые слова/`:

### Классы хранения
- [[auto]]
- [[extern]]
- [[register]]
- [[static]]
- [[_Thread_local]]

### Типы данных
- [[char]]
- [[short]]
- [[_main/Изучение языка С. От простых концепций до asm, simd и встраивания в другие языки./Ключевые слова/int]]
- [[long]]
- [[_main/Изучение языка С. От простых концепций до asm, simd и встраивания в другие языки./Ключевые слова/float]]
- [[double]]
- [[void]]
- [[_Bool]]
- [[_Complex]]
- [[_Imaginary]]

### Модификаторы типов
- [[signed]]
- [[unsigned]]
- [[const]]
- [[volatile]]
- [[restrict]]
- [[_Atomic]]

### Квалификаторы управления
- [[inline]]
- [[_Noreturn]]

### Управление потоком
- [[break]]
- [[case]]
- [[continue]]
- [[default]]
- [[do]]
- [[else]]
- [[for]]
- [[goto]]
- [[if]]
- [[return]]
- [[switch]]
- [[while]]

### Объявления типов
- [[enum]]
- [[struct]]
- [[union]]
- [[typedef]]

### Операторы
- [[sizeof]]
- [[_main/Изучение языка С. От простых концепций до asm, simd и встраивания в другие языки./Ключевые слова/_Alignof]]
- [[_Generic]]

### Выравнивание
- [[_main/Изучение языка С. От простых концепций до asm, simd и встраивания в другие языки./Ключевые слова/_Alignas]]

### Утверждения
- [[_Static_assert]]

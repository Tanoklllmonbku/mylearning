# float.h

**Назначение:** Пределы вещественных типов.

## Параметры точности

```c
FLT_RADIX      // основание экспоненты (2)
FLT_MANT_DIG   // цифр мантиссы float
DBL_MANT_DIG   // цифр мантиссы double
LDBL_MANT_DIG  // цифр мантиссы long double

FLT_DIG        // десятичных цифр float
DBL_DIG        // десятичных цифр double
LDBL_DIG       // десятичных цифр long double
```

## Параметры диапазона

```c
FLT_MIN_EXP    // мин. экспонента float
DBL_MIN_EXP    // мин. экспонента double
LDBL_MIN_EXP   // мин. экспонента long double

FLT_MIN_10_EXP // мин. 10-чная экспонента
DBL_MIN_10_EXP
LDBL_MIN_10_EXP

FLT_MAX_EXP    // макс. экспонента
DBL_MAX_EXP
LDBL_MAX_EXP

FLT_MAX_10_EXP // макс. 10-чная экспонента
DBL_MAX_10_EXP
LDBL_MAX_10_EXP
```

## Границы значений

```c
// float
FLT_MIN        // мин. положительное
FLT_MAX        // макс. конечное
FLT_EPSILON    // мин. разница > 1

// double
DBL_MIN
DBL_MAX
DBL_EPSILON

// long double
LDBL_MIN
LDBL_MAX
LDBL_EPSILON
```

## Примеры значений (IEEE 754)

```c
#include <float.h>
#include <stdio.h>

int main() {
    printf("FLT_RADIX: %d\n", FLT_RADIX);        // 2
    
    printf("FLT_DIG: %d\n", FLT_DIG);            // 6
    printf("DBL_DIG: %d\n", DBL_DIG);            // 15
    printf("LDBL_DIG: %d\n", LDBL_DIG);          // 18
    
    printf("FLT_MIN: %e\n", FLT_MIN);            // 1.175494e-38
    printf("FLT_MAX: %e\n", FLT_MAX);            // 3.402823e+38
    printf("FLT_EPSILON: %e\n", FLT_EPSILON);    // 1.192093e-07
    
    printf("DBL_MIN: %e\n", DBL_MIN);            // 2.225074e-308
    printf("DBL_MAX: %e\n", DBL_MAX);            // 1.797693e+308
    printf("DBL_EPSILON: %e\n", DBL_EPSILON);    // 2.220446e-16
    
    return 0;
}
```

## Применение

### 1. Сравнение вещественных

```c
#include <float.h>
#include <math.h>

int equal(double a, double b) {
    return fabs(a - b) < DBL_EPSILON;
}

int approx_equal(double a, double b, double tol) {
    return fabs(a - b) < tol;
}
```

### 2. Проверка на бесконечность

```c
#include <float.h>
#include <math.h>

if (x > DBL_MAX) {
    // переполнение
}

if (isinf(x)) {
    // бесконечность
}
```

### 3. Инициализация

```c
double min_val = DBL_MAX;
double max_val = -DBL_MAX;
```

## Источники
- [CppReference — float.h](https://en.cppreference.com/w/c/header/float_h)

## См. также
- [[Заголовочные файлы C]] — оглавление раздела
- [[limits.h]]
- [[math.h]]

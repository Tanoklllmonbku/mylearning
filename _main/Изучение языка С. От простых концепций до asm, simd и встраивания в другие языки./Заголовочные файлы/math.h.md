# math.h

**Назначение:** Математические функции.

## Константы (POSIX)

```c
M_E       // e (2.718...)
M_PI      // π (3.14159...)
M_SQRT2   // √2
M_LOG2E   // log₂(e)
```

## Тригонометрические функции

```c
double sin(double x);
double cos(double x);
double tan(double x);

double asin(double x);
double acos(double x);
double atan(double x);
double atan2(double y, double x);
```

## Гиперболические

```c
double sinh(double x);
double cosh(double x);
double tanh(double x);
```

## Экспонента и логарифмы

```c
double exp(double x);    // e^x
double log(double x);    // натуральный (ln)
double log10(double x);  // десятичный
double log2(double x);   // двоичный (C99)
double pow(double base, double exp);  // base^exp
double sqrt(double x);   // квадратный корень
double cbrt(double x);   // кубический (C99)
```

## Округление

```c
double ceil(double x);   // округление вверх
double floor(double x);  // округление вниз
double round(double x);  // до ближайшего (C99)
double trunc(double x);  // отбрасывание дробной (C99)
double rint(double x);   // по текущему режиму
```

## Другие функции

```c
double fabs(double x);   // модуль
double fmod(double x, double y);  // остаток от деления
double remainder(double x, double y);  // IEEE остаток
double fmin(double x, double y);  // минимум (C99)
double fmax(double x, double y);  // максимум (C99)
double fdim(double x, double y);  // x-y если x>y, иначе 0
double hypot(double x, double y);  // √(x²+y²) (C99)
```

## Проверка чисел

```c
int isfinite(double x);      // конечное (C99)
int isinf(double x);         // бесконечность
int isnan(double x);         // NaN
int isnormal(double x);      // нормализованное
int signbit(double x);       // знак отрицательный
```

## Примеры

```c
#include <math.h>
#include <stdio.h>

int main() {
    // Тригонометрия
    double angle = M_PI / 4;  // 45°
    printf("sin(π/4) = %f\n", sin(angle));  // 0.707
    
    // Степени и корни
    printf("2^10 = %f\n", pow(2, 10));  // 1024
    printf("√16 = %f\n", sqrt(16));     // 4
    
    // Логарифмы
    printf("ln(e) = %f\n", log(M_E));   // 1
    printf("log10(100) = %f\n", log10(100));  // 2
    
    // Округление
    printf("ceil(3.2) = %f\n", ceil(3.2));    // 4
    printf("floor(3.8) = %f\n", floor(3.8));  // 3
    printf("round(3.5) = %f\n", round(3.5));  // 4
    
    // Проверки
    double nan_val = 0.0 / 0.0;
    printf("isnan: %d\n", isnan(nan_val));  // 1
    
    // Гипотенуза
    printf("hypot(3,4) = %f\n", hypot(3, 4));  // 5
    
    return 0;
}
```

## Компиляция

```bash
gcc program.c -lm  # подключить math library
```

## Источники
- [CppReference — math.h](https://en.cppreference.com/w/c/header/math_h)

## См. также
- [[Заголовочные файлы C]] — оглавление раздела
- [[stdlib.h]]
- [[float.h]]

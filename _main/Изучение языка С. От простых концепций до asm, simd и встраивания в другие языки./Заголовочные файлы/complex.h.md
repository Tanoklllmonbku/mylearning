# complex.h

**Назначение:** Комплексные числа (C99).

## Типы

```c
float complex       // комплексный float
double complex      // комплексный double
long double complex // комплексный long double

float _Complex      // альтернативное имя
double _Complex
long double _Complex
```

## Макросы

```c
complex      // раскрывается как _Complex
I            // мнимая единица (√-1)
imaginary    // раскрывается как _Imaginary (если есть)
__STDC_NO_COMPLEX__  // определён если комплексные не поддерживаются
```

## Функции

### Базовые операции

```c
// Создание
double complex CMPLX(double x, double y);  // C99
float complex CMPLXF(float x, float y);

// Части
double creal(double complex z);
double cimag(double complex z);

// Сопряжённое
double complex conj(double complex z);

// Проекция
double complex cproj(double complex z);
```

### Модуль и аргумент

```c
double cabs(double complex z);    // модуль
double carg(double complex z);    // аргумент (угол)
```

### Тригонометрические

```c
double complex ccos(double complex z);
double complex csin(double complex z);
double complex ctan(double complex z);

double complex cacos(double complex z);
double complex casin(double complex z);
double complex catan(double complex z);
```

### Гиперболические

```c
double complex ccosh(double complex z);
double complex csinh(double complex z);
double complex ctanh(double complex z);

double complex cacosh(double complex z);
double complex casinh(double complex z);
double complex catanh(double complex z);
```

### Экспонента и логарифм

```c
double complex cexp(double complex z);
double complex clog(double complex z);
double complex cpow(double complex base, double complex exp);
double complex csqrt(double complex z);
```

## Примеры

```c
#include <complex.h>
#include <stdio.h>
#include <math.h>

int main() {
    // Создание комплексных чисел
    double complex z1 = 3.0 + 4.0 * I;
    double complex z2 = CMPLX(1.0, -2.0);
    
    // Арифметика
    double complex sum = z1 + z2;
    double complex prod = z1 * z2;
    
    // Части
    printf("Real: %f\n", creal(z1));    // 3.0
    printf("Imag: %f\n", cimag(z1));    // 4.0
    
    // Модуль и аргумент
    printf("|z| = %f\n", cabs(z1));     // 5.0
    printf("arg = %f rad\n", carg(z1)); // 0.927
    
    // Сопряжённое
    double complex conj_z = conj(z1);   // 3.0 - 4.0*I
    
    // Экспонента
    double complex e = cexp(I * M_PI);  // -1 + 0*I (формула Эйлера)
    printf("e^(iπ) = %f + %fi\n", creal(e), cimag(e));
    
    // Корень
    double complex sqrt_z = csqrt(z1);
    
    return 0;
}
```

## Формула Эйлера

```c
#include <complex.h>
#include <math.h>

// e^(iθ) = cos(θ) + i*sin(θ)
double complex euler(double theta) {
    return cexp(I * theta);
}

// Проверка: e^(iπ) + 1 = 0
double complex result = cexp(I * M_PI) + 1;
printf("%e + %ei\n", creal(result), cimag(result));  // ~0
```

## Источники
- [CppReference — complex.h](https://en.cppreference.com/w/c/header/complex_h)

## См. также
- [[Заголовочные файлы C]] — оглавление раздела
- [[_Complex]]
- [[_Imaginary]]
- [[math.h]]

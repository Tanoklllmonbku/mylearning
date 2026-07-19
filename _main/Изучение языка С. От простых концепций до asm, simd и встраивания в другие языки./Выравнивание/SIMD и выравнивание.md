# SIMD и выравнивание

SIMD (Single Instruction, Multiple Data) требует строгого выравнивания для эффективной работы.

## Требования SIMD

| Технология | Минимальное выравнивание |
|------------|-------------------------|
| SSE (128 бит) | 16 байт |
| AVX (256 бит) | 32 байта |
| AVX-512 (512 бит) | 64 байта |
| NEON (ARM) | 16 байт |

## Пример: SSE

```c
#include <xmmintrin.h>  // SSE

// __m128 требует выравнивания 16 байт
_Alignas(16) __m128 vec1;
_Alignas(16) __m128 vec2;

// Выровненный массив
_Alignas(16) float data[4];

// Операции
__m128 result = _mm_add_ps(vec1, vec2);
```

## Пример: AVX

```c
#include <immintrin.h>  // AVX

// __m256 требует выравнивания 32 байта
_Alignas(32) __m256 vec_avx;

// Динамическое выделение
__m256* arr = aligned_alloc(32, sizeof(__m256) * 10);
```

## Проблемы при неправильном выравнивании

```c
// НЕВЕРНО — может вызвать исключение
char buffer[32];
__m128* ptr = (__m128*)buffer;  // невыровненный доступ!

// ВЕРНО
_Alignas(16) char buffer[32];
__m128* ptr = (__m128*)buffer;  // выровнено
```

## Источники
- [Intel Intrinsics Guide](https://www.intel.com/content/www/us/en/docs/intrinsics-guide/)
- [CppReference — Alignment](https://en.cppreference.com/w/c/language/Alignment)

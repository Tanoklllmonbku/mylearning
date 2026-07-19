# stddef.h

**Назначение:** Основные определения и типы общего назначения.

## Содержимое

### Типы

```c
ptrdiff_t    // разность указателей (signed)
size_t       // размер объектов (unsigned)
wchar_t      // широкий символ
max_align_t  // максимальное выравнивание (C11)
nullptr_t    // тип nullptr (C23)
```

### Макросы

```c
NULL         // нулевой указатель
offsetof(type, member)  // смещение члена в структуре
```

## Пример использования

```c
#include <stddef.h>
#include <stdio.h>

struct Data {
    char a;
    int b;
    double c;
};

int main() {
    // size_t для размеров
    size_t size = sizeof(struct Data);
    printf("Size: %zu\n", size);
    
    // offsetof для смещений
    printf("Offset of b: %zu\n", offsetof(struct Data, b));
    
    // NULL для указателей
    int* ptr = NULL;
    
    return 0;
}
```

## Применение

- `size_t` — для размеров массивов, циклов
- `ptrdiff_t` — для арифметики указателей
- `offsetof` — для сериализации, reflection
- `max_align_t` — для выравнивания памяти

## Источники
- [CppReference — stddef.h](https://en.cppreference.com/w/c/types/stddef_h)

## См. также
- [[Заголовочные файлы C]] — оглавление раздела
- [[stdint.h]]
- [[stdalign.h]]

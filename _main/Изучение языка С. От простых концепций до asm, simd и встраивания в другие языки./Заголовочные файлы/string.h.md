# string.h

**Назначение:** Работа со строками и памятью.

## Типы

```c
size_t  // размер типа (беззнаковый)
```

## Функции работы с памятью

```c
void* memcpy(void* dest, const void* src, size_t n);
void* memmove(void* dest, const void* src, size_t n);
void* memset(void* ptr, int value, size_t n);
int memcmp(const void* s1, const void* s2, size_t n);
void* memchr(const void* s, int c, size_t n);
```

## Функции работы со строками

### Длина и копирование

```c
size_t strlen(const char* s);
char* strcpy(char* dest, const char* src);
char* strncpy(char* dest, const char* src, size_t n);
char* strdup(const char* s);      // POSIX, не стандарт C
size_t strnlen(const char* s, size_t max);  // C11
```

### Конкатенация

```c
char* strcat(char* dest, const char* src);
char* strncat(char* dest, const char* src, size_t n);
```

### Сравнение

```c
int strcmp(const char* s1, const char* s2);
int strncmp(const char* s1, const char* s2, size_t n);
int strcoll(const char* s1, const char* s2);  // локаль
```

### Поиск

```c
char* strchr(const char* s, int c);      // первое вхождение
char* strrchr(const char* s, int c);     // последнее вхождение
char* strstr(const char* haystack, const char* needle);
size_t strspn(const char* s1, const char* s2);
size_t strcspn(const char* s1, const char* s2);
char* strpbrk(const char* s1, const char* s2);
char* strtok(char* str, const char* delim);
```

## Примеры

```c
#include <string.h>
#include <stdio.h>

int main() {
    // Длина
    const char* s = "Hello";
    size_t len = strlen(s);  // 5
    
    // Копирование
    char dest[20];
    strcpy(dest, "World");
    strncpy(dest, "Safe", sizeof(dest) - 1);
    
    // Конкатенация
    char buf[50] = "Hello";
    strcat(buf, " ");
    strncat(buf, "World", sizeof(buf) - strlen(buf) - 1);
    
    // Сравнение
    if (strcmp("abc", "abd") < 0) {
        printf("abc < abd\n");
    }
    
    // Поиск
    char* p = strchr("Hello", 'l');  // указатель на первое 'l'
    char* sub = strstr("Hello World", "World");  // "World"
    
    // Токенизация
    char text[] = "one,two,three";
    char* token = strtok(text, ",");
    while (token) {
        printf("%s\n", token);
        token = strtok(NULL, ",");
    }
    
    // Работа с памятью
    int arr[10];
    memset(arr, 0, sizeof(arr));  // обнуление
    memcpy(dest_arr, src_arr, sizeof(src_arr));
    memmove(arr+1, arr, 9*sizeof(int));  // безопасно при перекрытии
    
    return 0;
}
```

## Различия memcpy/memmove

```c
// memcpy — НЕЛЬЗЯ при перекрытии
char buf[10] = "abcdefgh";
memcpy(buf+1, buf, 5);  // НЕОПРЕДЕЛЁННОЕ поведение!

// memmove — МОЖНО при перекрытии
memmove(buf+1, buf, 5);  // безопасно
```

## Источники
- [CppReference — string.h](https://en.cppreference.com/w/c/header/string_h)

## См. также
- [[Заголовочные файлы C]] — оглавление раздела
- [[stdio.h]]
- [[stdlib.h]]

# ctype.h

**Назначение:** Классификация и преобразование символов.

## Функции классификации

Возвращают ненулевое значение, если условие истинно:

```c
int isalpha(int c);   // буква
int isdigit(int c);   // цифра
int isalnum(int c);   // буква или цифра
int islower(int c);   // строчная
int isupper(int c);   // заглавная
int isxdigit(int c);  // шестнадцатеричная цифра
int isspace(int c);   // пробельный символ
int ispunct(int c);   // знак препинания
int isprint(int c);   // печатный
int isgraph(int c);   // печатный не пробел
int iscntrl(int c);   // управляющий
```

## Функции преобразования

```c
int tolower(int c);   // в нижний регистр
int toupper(int c);   // в верхний регистр
```

## Примеры

```c
#include <ctype.h>
#include <stdio.h>
#include <string.h>

int main() {
    char c = 'A';
    
    // Классификация
    if (isalpha(c)) printf("буква\n");
    if (isupper(c)) printf("заглавная\n");
    if (isdigit('5')) printf("цифра\n");
    if (isspace('\n')) printf("пробел\n");
    
    // Преобразование
    printf("%c\n", tolower('A'));  // 'a'
    printf("%c\n", toupper('z'));  // 'Z'
    
    // Обработка строки
    const char* str = "Hello, World!";
    int letters = 0, digits = 0, spaces = 0;
    
    for (int i = 0; str[i]; i++) {
        if (isalpha(str[i])) letters++;
        if (isdigit(str[i])) digits++;
        if (isspace(str[i])) spaces++;
    }
    
    // Конвертация регистра строки
    char buf[] = "Hello World";
    for (int i = 0; buf[i]; i++) {
        buf[i] = tolower(buf[i]);
    }
    printf("%s\n", buf);  // "hello world"
    
    // Проверка шестнадцатеричной цифры
    if (isxdigit('A')) printf("hex digit\n");
    if (isxdigit('7')) printf("hex digit\n");
    
    return 0;
}
```

## Важные замечания

- Аргумент должен быть `unsigned char` или `EOF`
- Поведение с отрицательными char — неопределено

```c
// ПЛОХО
char c = -1;
if (isalpha(c)) { }  // неопределено!

// ХОРОШО
unsigned char c = getc(stdin);
if (isalpha(c)) { }
```

## Источники
- [CppReference — ctype.h](https://en.cppreference.com/w/c/header/ctype_h)

## См. также
- [[Заголовочные файлы C]] — оглавление раздела
- [[string.h]]
- [[stdio.h]]

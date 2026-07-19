# time.h

**Назначение:** Работа со временем и датой.

## Типы

```c
time_t     // время (секунды с epoch)
clock_t    // процессорное время
struct tm  // структура времени
```

## Структура tm

```c
struct tm {
    int tm_sec;   // секунды (0-60)
    int tm_min;   // минуты (0-59)
    int tm_hour;  // часы (0-23)
    int tm_mday;  // день месяца (1-31)
    int tm_mon;   // месяц (0-11)
    int tm_year;  // годы с 1900
    int tm_wday;  // день недели (0-6, 0=воскресенье)
    int tm_yday;  // день года (0-365)
    int tm_isdst; // флаг летнего времени
};
```

## Функции

### Получение времени

```c
time_t time(time_t* arg);           // текущее время
clock_t clock(void);                // процессорное время
double difftime(time_t end, time_t start);  // разница в секундах
```

### Преобразование

```c
char* asctime(const struct tm* tm);           // строка
char* ctime(const time_t* timer);             // строка из time_t
struct tm* gmtime(const time_t* timer);       // UTC
struct tm* localtime(const time_t* timer);    // локальное
time_t mktime(struct tm* tm);                 // tm → time_t
```

### Форматирование

```c
size_t strftime(char* str, size_t max, 
                const char* fmt, const struct tm* tm);
```

## Примеры

```c
#include <time.h>
#include <stdio.h>

int main() {
    // Текущее время
    time_t now = time(NULL);
    printf("Current time: %ld\n", (long)now);
    
    // Локальное время
    struct tm* local = localtime(&now);
    printf("Year: %d, Month: %d, Day: %d\n",
           local->tm_year + 1900,
           local->tm_mon + 1,
           local->tm_mday);
    
    // Форматирование
    char buffer[100];
    strftime(buffer, sizeof(buffer), 
             "%Y-%m-%d %H:%M:%S", local);
    printf("Formatted: %s\n", buffer);
    
    // UTC
    struct tm* utc = gmtime(&now);
    printf("UTC: %s", asctime(utc));
    
    // Замер времени
    clock_t start = clock();
    // ... код ...
    clock_t end = clock();
    double elapsed = (double)(end - start) / CLOCKS_PER_SEC;
    printf("Elapsed: %f seconds\n", elapsed);
    
    // Разница дат
    time_t t1 = mktime(&(struct tm){.tm_year=2020-1900, .tm_mon=0, .tm_mday=1});
    time_t t2 = mktime(&(struct tm){.tm_year=2024-1900, .tm_mon=0, .tm_mday=1});
    printf("Days: %.0f\n", difftime(t2, t1) / 86400);
    
    return 0;
}
```

## Форматы strftime

| Спецификатор | Значение | Пример |
|--------------|----------|--------|
| `%Y` | Год (4 цифры) | 2026 |
| `%y` | Год (2 цифры) | 26 |
| `%m` | Месяц | 03 |
| `%d` | День | 08 |
| `%H` | Часы (24h) | 14 |
| `%M` | Минуты | 30 |
| `%S` | Секунды | 45 |
| `%A` | День недели | воскресенье |
| `%B` | Месяц | марта |

## Источники
- [CppReference — time.h](https://en.cppreference.com/w/c/header/time_h)

## См. также
- [[Заголовочные файлы C]] — оглавление раздела
- [[stdio.h]]

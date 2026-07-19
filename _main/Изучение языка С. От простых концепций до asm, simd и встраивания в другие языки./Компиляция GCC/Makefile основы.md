# Makefile основы

Автоматизация сборки с помощью Make.

## Базовая структура

```makefile
# Переменные
CC = gcc
CFLAGS = -Wall -Wextra
LDFLAGS = -lm

# Цель: зависимости
# 	команда (табуляция!)

program: main.o utils.o
	$(CC) $(LDFLAGS) main.o utils.o -o program

main.o: main.c utils.h
	$(CC) $(CFLAGS) -c main.c

utils.o: utils.c utils.h
	$(CC) $(CFLAGS) -c utils.c

clean:
	rm -f *.o program

.PHONY: clean
```

## Запуск make

```bash
make        # сборка по умолчанию (первая цель)
make clean  # очистка
make all    # явная сборка
```

## Переменные

```makefile
# Простое присваивание
CC = gcc
CFLAGS = -Wall -O2

# Ссылка на переменную
PROGRAM = myapp
TARGET = $(PROGRAM)

# Автоматические переменные
$@  # имя цели
$<  # первая зависимость
$^  # все зависимости
```

## Примеры правил

### Компиляция одного файла

```makefile
program: program.c
	$(CC) $(CFLAGS) program.c -o program
```

### Несколько файлов

```makefile
SRCS = main.c utils.c math_ops.c
OBJS = $(SRCS:.c=.o)

program: $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o program

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@
```

### С заголовками

```makefile
main.o: main.c utils.h config.h
	$(CC) $(CFLAGS) -c main.c

utils.o: utils.c utils.h
	$(CC) $(CFLAGS) -c utils.c
```

### Автоматические зависимости

```makefile
# Генерация зависимостей
DEPS = $(SRCS:.c=.d)

-include $(DEPS)

%.d: %.c
	$(CC) -MM $< > $@
```

## Цели

```makefile
# Основная цель
all: program

# Очистка
clean:
	rm -f *.o program

# Перекомпиляция
rebuild: clean all

# Установка
install: program
	cp program /usr/local/bin/

.PHONY: all clean rebuild install
```

## Полный пример

```makefile
CC = gcc
CFLAGS = -Wall -Wextra -O2
LDFLAGS = -lm

SRCS = src/main.c src/utils.c src/math_ops.c
OBJS = $(SRCS:.c=.o)
TARGET = bin/program

.PHONY: all clean rebuild

all: $(TARGET)

$(TARGET): $(OBJS)
	@mkdir -p bin
	$(CC) $(LDFLAGS) $(OBJS) -o $@

src/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

rebuild: clean all
```

## Встроенные переменные

| Переменная | Значение |
|------------|----------|
| `CC` | gcc (компилятор C) |
| `CXX` | g++ (компилятор C++) |
| `CFLAGS` | флаги C |
| `CXXFLAGS` | флаги C++ |
| `LDFLAGS` | флаги линковки |
| `LDLIBS` | библиотеки |

## Условия

```makefile
ifdef DEBUG
CFLAGS += -g -DDEBUG
else
CFLAGS += -O2
endif

ifeq ($(OS),Windows_NT)
TARGET = program.exe
else
TARGET = program
endif
```

## Функции

```makefile
# Получить все .c файлы
SRCS = $(wildcard src/*.c)

# Заменить .c на .o
OBJS = $(SRCS:.c=.o)

# Получить имена без пути
NAMES = $(notdir $(SRCS))
```

## См. также
- [[Компиляция GCC]] — оглавление раздела
- [[Примеры сборки проектов]]
- [[Статические библиотеки]]

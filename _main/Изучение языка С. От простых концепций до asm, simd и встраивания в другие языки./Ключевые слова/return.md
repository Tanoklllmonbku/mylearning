# return

**Категория:** Управление потоком

## Назначение

Завершение функции и возврат значения.

## Пример

```c
int add(int a, int b) {
    return a + b;
}

int find(int* arr, int n, int target) {
    for (int i = 0; i < n; i++) {
        if (arr[i] == target) {
            return i;
        }
    }
    return -1;
}
```

## Пример из практики

Возврат из `main()` в [[Hello World]]:

```c
int main() {
    printf("Hello, World!\n");
    return 0;  // 0 означает успешное завершение
}
```

В [[Калькулятор]] `return 0` также используется для обозначения успеха программы.

## Источники
- [CppReference — return](https://en.cppreference.com/w/c/language/return)

## См. также
- [[_main/Изучение языка С. От простых концепций до asm, simd и встраивания в другие языки./Ключевые слова/int]] — тип возвращаемого значения
- [[Функция main в C]] — точка входа
- [[Hello World]] — практический пример

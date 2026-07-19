# restrict

**Категория:** Квалификатор типа (C99)

## Назначение

Подсказка компилятору, что указатель является **единственным способом** доступа к объекту.

## Пример

```c
void add_opt(int* restrict a, int* restrict b, int* restrict c, int n) {
    for (int i = 0; i < n; i++) {
        c[i] = a[i] + b[i];  // гарантированно нет перекрытия
    }
}
```

## Правила

- Применяется **только к указателям**
- Нарушение ведёт к **неопределённому поведению**

## Источники
- [CppReference — Type qualifier](https://en.cppreference.com/w/c/language/type_qualifier)

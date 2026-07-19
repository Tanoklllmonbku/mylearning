#include <threads.h>
#include <stdio.h>

static char charset_glob[] = {'H', 'E', 'L', 'L', 'O', ' ', 'W', 'O', 'R', 'L', 'D', '!'};
thread_local int char_counter = 0;

/*
Поменяв static на thread_local - не поменяем сути из-за указания АДРЕСА (&) в памяти, а не поинтера на массив. Нужно делать копию массива в каждом потоке, либо - напрямую передавать отдельные массивы в разные потоки.
*/

struct ThreadData {
    char *charset;
    size_t size;
};

int thread1(void *args) {
    /*Required charset*/
    struct ThreadData *data = (struct ThreadData *)args;
    char *_charset = data->charset;
    size_t _size = data->size;
    printf("Start counting from: %d\n", char_counter);
    for (char_counter; char_counter <= _size-1; char_counter++) {
        printf("%c\n", _charset[char_counter]);
        _charset[char_counter] = 'E';
    }
    printf("%s\n", _charset);
    printf("%d\n", char_counter);
    return 0;
}

int thread2(void *args) {
    //Required charset
    struct ThreadData *data = (struct ThreadData *)args;
    char *_charset = data->charset;
    size_t _size = data->size;
    printf("Start counting from: %d\n", char_counter);
    for (char_counter; char_counter <= _size-1; char_counter++) {
        printf("%c\n", _charset[char_counter]);
        _charset[char_counter] = 'D';
    }
    printf("%s\n", _charset);
    printf("%d\n", char_counter);
    return 0;
}

int main() {
    thrd_t t1, t2;
    struct ThreadData data = {.charset = charset_glob, .size = sizeof(charset_glob) / sizeof(charset_glob[0])};
    thrd_create(&t1, thread1, &data); // Указание адреса переменной, из-за чего thread_local не спасает.
    thrd_create(&t2, thread2, &data);
    thrd_join(t1, NULL); // Не интересует возвращаемое значение. Для возврата - пишем указатель на адрес переменной (&result условно) и выводим нужное сообщение.
    thrd_join(t2, NULL);
    return 0;
}
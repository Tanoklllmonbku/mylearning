#include <stdnoreturn.h>
#include <stdlib.h>
#include <stdio.h>

noreturn void fatal(const char* msg, int code) {
    fprintf(stderr, "[FATAL %d] %s\n", code, msg);
    exit(code);
}

int example(int* x, size_t size) {
    // Предусловие: размер должен быть ≥ 5
    if (size < 5) {
        goto err_size;
    }
    
    // Основная логика (безопасные границы: 0..4)
    for (size_t i = 0; i < 5; i++) {
        x[i] = 1;
    }
    
    // Успех: явный возврат, чтобы не «упасть» в обработчик
    printf("%p", x);
    return 0;

    // Блок обработки ошибок
err_size:
    fatal("Array size insufficient (need ≥5)", 1);
    
    // Недостижимо из-за noreturn, но формально для компилятора
    return -1;
}

int main() {
    int arg[7] = {1, 2, 3, 4, 5, 6, 7};
    example(arg, 7);  // Ожидается: [FATAL 1] Array size insufficient
    return 0;
}
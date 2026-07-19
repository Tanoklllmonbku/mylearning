#include <stdnoreturn.h>
#include <stdio.h>
#include <stdlib.h>

noreturn void fatal(const char* msg, int code) {
    fprintf(stderr, "[FATAL %d] %s\n", code, msg);  // Вывод в stderr
    exit(code);  // Завершение программы — обязательно для noreturn
}

noreturn void work_w_err() {
    int buff[5];
    for(int i = 0; i<=20; i++) {
        buff[i] = 1;
    }

    fatal("SEGFAULT!", 101);
}

void check_error(int err_code) {
    if (err_code == 42) {
        // Особое сообщение для "магического" кода ошибки
        fatal("Special error 42: The Answer to Everything", 42);
    }
    else if (err_code != 0) {
        // Обычная ошибка
        fatal("Generic error occurred", err_code);
    }
    // Если err_code == 0 — всё хорошо, ничего не делаем
}

int main(int argc, char* argv[]) {
    // Режим 1: Проверка особого кода ошибки
    if (argc > 1 && argv[1][0] == '4' && argv[1][1] == '2') {
        check_error(42);  // 🎯 Особое сообщение для кода 42
    }
    
    // Режим 2: Запуск переполнения буфера
    if (argc > 1 && argv[1][0] == 'c') {
        work_w_err();  // 💥 Переполнение → сегментация
    }
    
    // Режим 3: Обычная ошибка с другим кодом
    if (argc > 1 && argv[1][0] == 'e') {
        check_error(99);  // Обычное сообщение об ошибке
    }
    
    // Штатный запуск
    fprintf(stderr, "Usage: %s [42|crash|error]\n", argv[0]);
    fprintf(stderr, "  42    — показать особое сообщение для кода 42\n");
    fprintf(stderr, "  crash — вызвать переполнение буфера (сегментация)\n");
    fprintf(stderr, "  error — обычная ошибка с кодом 99\n");
    
    return 0;
}
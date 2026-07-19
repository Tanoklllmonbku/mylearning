#include "logging.h"

static FILE* log_file_handle = NULL;  // Статический дескриптор

void logging_init(const char* filepath) { // Инициализация для "Прогрева" с получением активного дескриптора
    if (log_file_handle) fclose(log_file_handle);

    if (filepath) {
        log_file_handle = fopen(filepath, "a");
        if (!log_file_handle) {
            fprintf(stderr, "Failed to open log file: %s\n", filepath);
        }
    }
}

void logging_shutdown(void) {
    if (log_file_handle && log_file_handle != stdout && log_file_handle != stderr) { // Не даём закрыть файл пока есть работа\ошибка
        fclose(log_file_handle);
        log_file_handle = NULL;
    }
}

void log_write_c(const char* message, 
                 int level, 
                 const char* file, 
                 const char* func, 
                 int line,
                 bool write_to_file) {
    
    const char* level_str = (const char*[]){ "DEBUG", "INFO ", "WARN ", "ERROR" }[level];
    long timestamp = (long)time(NULL);
    
    char buffer[4096];
    int len = snprintf(buffer, sizeof(buffer), 
                       "[%ld] [%s] %s:%d in %s(): %s\n",
                       timestamp, level_str, file, line, func, message);
    if (len < 0 || len >= sizeof(buffer)) return;
    
    // 1. Вывод в консоль
    FILE* console_out = (level >= 0) ? stderr : stdout;
    fprintf(console_out, "%s", buffer);
    fflush(console_out);
    
    // 2. Вывод в файл (БЕЗ fopen/fclose!)
    if (write_to_file) {
        if (log_file_handle==NULL) {
            printf("Log file closed!");
        } else {
        fprintf(log_file_handle, "%s", buffer);
        fflush(log_file_handle);  // Гарантируем запись
        } 
    }
}
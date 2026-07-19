#ifndef LOGGING_H
#define LOGGING_H

#include <stdio.h>
#include <stdbool.h>
#include <time.h>

// 1. Сначала открываем блок C-линковки (если это C++)
#ifdef __cplusplus
extern "C" {
#endif

// 2. Затем объявляем ВСЁ: типы, функции, макросы
//    Теперь они гарантированно имеют правильные имена для линковщика

typedef enum {
    _DEBUG = 0, _INFO = 1, _WARN = 2, _ERROR = 3
} LogLevel;

typedef struct {
    const char* filename;
    const char* func_name;
    int code_line;
    long timestamp;
} LogMetadata;

typedef struct {
    const char* log;
    LogLevel logging_level;
    LogMetadata metadata;
} LogRecord;

void logging_init(const char* filepath);
void logging_shutdown(void);
void log_write_c(const char* message, int level, const char* file, 
                 const char* func, int line, bool write_to_file);

#define LOG_DEBUG(msg) log_write_c((msg), _DEBUG, __FILE__, __func__, __LINE__, false)
#define LOG_INFO(msg)  log_write_c((msg), _INFO,  __FILE__, __func__, __LINE__, true)
#define LOG_WARN(msg)  log_write_c((msg), _WARN,  __FILE__, __func__, __LINE__, true)
#define LOG_ERROR(msg) log_write_c((msg), _ERROR, __FILE__, __func__, __LINE__, true)

// 3. В конце закрываем блок
#ifdef __cplusplus
}
#endif

#endif /* LOGGING_H */
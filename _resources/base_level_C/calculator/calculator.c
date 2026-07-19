//calculator.c
#include "calculator.h"

_CHAR_OPS char_ops = {
    .sum = '+',
    .min = '-',
    .div = '/',
    .mult = '*'
};

void delete_spaces(char *str) {
    char *source = str;
    char *dest = str;

    while (*source){
        if (*source != ' ') {
            *dest = *source;
            dest++;
        }
        source++;
    }
    *dest = '\0';
}

// Токен: число или оператор
typedef enum {
    TOKEN_NUMBER,
    TOKEN_OPERATOR
} TokenType;

typedef struct {
    TokenType type;
    int value;        // для числа
    char op;          // для оператора
} Token;

// Пропуск пробелов (если остались)
static int skip_spaces(const char *str, int pos) {
    while (str[pos] == ' ' || str[pos] == '\t') pos++;
    return pos;
}

// Парсинг токенов из строки. Возвращает количество токенов.
// tokens - массив токенов, max_tokens - максимальное количество
static int parse_tokens(const char *input, Token *tokens, int max_tokens) {
    int pos = 0;
    int token_count = 0;
    int len = strlen(input);

    while (pos < len && token_count < max_tokens) {
        pos = skip_spaces(input, pos);
        if (pos >= len) break;

        char c = input[pos];

        // Скобки
        if (c == '(' || c == ')') {
            tokens[token_count].type = TOKEN_OPERATOR;
            tokens[token_count].op = c;
            tokens[token_count].value = 0;
            token_count++;
            pos++;
            continue;
        }

        // Операторы
        if (c == '+' || c == '-' || c == '*' || c == '/') {
            tokens[token_count].type = TOKEN_OPERATOR;
            tokens[token_count].op = c;
            tokens[token_count].value = 0;
            token_count++;
            pos++;
            continue;
        }

        // Число
        if (isdigit(c)) {
            int value = 0;
            while (pos < len && isdigit(input[pos])) {
                value = value * 10 + (input[pos] - '0');
                pos++;
            }
            tokens[token_count].type = TOKEN_NUMBER;
            tokens[token_count].value = value;
            tokens[token_count].op = '\0';
            token_count++;
            continue;
        }

        // Неизвестный символ - пропускаем
        pos++;
    }

    return token_count;
}

// Обработка унарных минусов. 
// Превращает последовательности вроде "- 5" в число "-5"
// tokens - массив токенов, count - количество токенов
// result_tokens - выходной массив (может быть тем же самым)
// Возвращает новое количество токенов
static int handle_unary_minus(Token *tokens, int count, Token *result_tokens) {
    int result_count = 0;
    bool expect_number = true;  // true, если ожидаем число (после оператора или открывающей скобки)

    for (int i = 0; i < count; i++) {
        Token t = tokens[i];

        if (t.type == TOKEN_OPERATOR && t.op == '-' && expect_number) {
            // Это унарный минус - проверяем, есть ли число после
            if (i + 1 < count && tokens[i + 1].type == TOKEN_NUMBER) {
                // Создаём число с отрицательным знаком
                result_tokens[result_count].type = TOKEN_NUMBER;
                result_tokens[result_count].value = -tokens[i + 1].value;
                result_tokens[result_count].op = '\0';
                result_count++;
                i++;  // пропускаем следующее число
                expect_number = false;
                continue;
            }
        }

        // Копируем токен как есть
        result_tokens[result_count] = t;
        result_count++;

        if (t.type == TOKEN_NUMBER || t.op == ')') {
            expect_number = false;
        } else if (t.op == '(' || t.op == '+' || t.op == '-' || t.op == '*' || t.op == '/') {
            expect_number = true;
        }
    }

    return result_count;
}

// Поиск позиции закрывающей скобки для открывающей скобки на позиции start
// Возвращает позицию закрывающей скобки или -1, если не найдена
static int find_matching_paren(Token *tokens, int count, int start) {
    int depth = 1;
    for (int i = start + 1; i < count; i++) {
        if (tokens[i].type == TOKEN_OPERATOR) {
            if (tokens[i].op == '(') depth++;
            else if (tokens[i].op == ')') {
                depth--;
                if (depth == 0) return i;
            }
        }
    }
    return -1;  // не найдено
}

// Поиск самой глубокой пары скобок
// Возвращает позицию открывающей скобки или -1, если скобок нет
static int find_deepest_paren(Token *tokens, int count) {
    int max_depth = 0;
    int current_depth = 0;
    int deepest_open = -1;

    for (int i = 0; i < count; i++) {
        if (tokens[i].type == TOKEN_OPERATOR) {
            if (tokens[i].op == '(') {
                current_depth++;
                if (current_depth > max_depth) {
                    max_depth = current_depth;
                    deepest_open = i;
                }
            } else if (tokens[i].op == ')') {
                current_depth--;
            }
        }
    }

    return deepest_open;
}

// Вычисление простого выражения без скобок
// tokens - массив токенов (только числа и +, -, *, /)
// count - количество токенов
// Возвращает результат вычисления
static int evaluate_simple(Token *tokens, int count) {
    if (count == 0) return 0;
    if (count == 1 && tokens[0].type == TOKEN_NUMBER) {
        return tokens[0].value;
    }

    // Сначала обрабатываем * и /i ma
    // Используем массив для промежуточных результатов
    int values[MAX_TOKENS];
    char ops[MAX_TOKENS];
    int val_count = 0;
    int op_count = 0;

    // Копируем первое число
    if (tokens[0].type == TOKEN_NUMBER) {
        values[val_count++] = tokens[0].value;
    }

    for (int i = 1; i < count; i++) {
        if (tokens[i].type == TOKEN_OPERATOR) {
            char op = tokens[i].op;
            if (op == '*' || op == '/') {
                // Применяем сразу
                if (val_count > 0 && i + 1 < count && tokens[i + 1].type == TOKEN_NUMBER) {
                    int b = tokens[i + 1].value;
                    if (op == '*') {
                        values[val_count - 1] = __MUL(values[val_count - 1], b);
                    } else {
                        values[val_count - 1] = __DIV(values[val_count - 1], b);
                    }
                    i++;  // пропускаем число
                }
            } else if (op == '+' || op == '-') {
                ops[op_count++] = op;
                if (i + 1 < count && tokens[i + 1].type == TOKEN_NUMBER) {
                    values[val_count++] = tokens[i + 1].value;
                    i++;  // пропускаем число
                }
            }
        } else if (tokens[i].type == TOKEN_NUMBER) {
            values[val_count++] = tokens[i].value;
        }
    }

    // Теперь обрабатываем + и -
    int result = values[0];
    for (int i = 0; i < op_count && i + 1 < val_count; i++) {
        if (ops[i] == '+') {
            result = __SUM(result, values[i + 1]);
        } else if (ops[i] == '-') {
            result = __SUB(result, values[i + 1]);
        }
    }

    return result;
}

// Главная функция вычисления
// Возвращает результат вычисления выражения
int get_result(char* input) {
    Token tokens[MAX_TOKENS];
    Token processed[MAX_TOKENS];
    
    int count = parse_tokens(input, tokens, MAX_TOKENS);
    
    // Обработка унарных минусов
    count = handle_unary_minus(tokens, count, processed);
    
    // Обработка скобок (с самых глубоких)
    while (1) {
        int open_pos = find_deepest_paren(processed, count);
        if (open_pos == -1) break;  // скобок нет
        
        int close_pos = find_matching_paren(processed, count, open_pos);
        if (close_pos == -1) break;  // ошибка в скобках
        
        // Извлекаем выражение внутри скобок
        Token inner[MAX_TOKENS];
        int inner_count = 0;
        for (int i = open_pos + 1; i < close_pos; i++) {
            inner[inner_count++] = processed[i];
        }
        
        // Вычисляем выражение в скобках
        int inner_result = evaluate_simple(inner, inner_count);
        
        // Создаём новый массив токенов, заменяя (... ) на результат
        Token new_tokens[MAX_TOKENS];
        int new_count = 0;
        
        for (int i = 0; i < open_pos; i++) {
            new_tokens[new_count++] = processed[i];
        }
        
        // Добавляем результат как число
        new_tokens[new_count].type = TOKEN_NUMBER;
        new_tokens[new_count].value = inner_result;
        new_tokens[new_count].op = '\0';
        new_count++;
        
        for (int i = close_pos + 1; i < count; i++) {
            new_tokens[new_count++] = processed[i];
        }
        
        // Копируем обратно
        for (int i = 0; i < new_count; i++) {
            processed[i] = new_tokens[i];
        }
        count = new_count;
    }
    
    // Вычисляем финальное выражение без скобок
    return evaluate_simple(processed, count);
}

void scan_input(char *buffer, int size) {
    fgets(buffer, size, stdin);
    int len = strlen(buffer);
    if (len > 0 && buffer[len-1] == '\n') {
        buffer[len-1] = '\0';
    }
}

int main() {
    char input[MAX_INPUT_LEN];
    while (true) {
        printf("Enter the expression:\n");
        scan_input(input, sizeof(input));
        delete_spaces(input);
        
        int result = get_result(input);
        printf("Result: %d\n", result);
        
    }

    return 0;
}
//calculator.h
#ifndef CALCULATOR_H
#define CALCULATOR_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <ctype.h>
#include "sum.h"
#include "sub.h"
#include "mul.h"
#include "div.h"

#define MAX_INPUT_LEN 100
#define MAX_TOKENS 99
#define MAX_TOKEN_LEN 20

typedef struct {
    char sum;
    char min;
    char div;
    char mult;
} _CHAR_OPS;

extern _CHAR_OPS char_ops;

void delete_spaces(char *str);
void scan_input(char *buffer, int size);
int get_result(char *input);

#endif
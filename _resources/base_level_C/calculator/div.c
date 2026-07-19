//div.c
#include "div.h"

int __DIV(int a, int b)
{
    if (b == 0) {
        return 0;  // защита от деления на ноль
    }
    return a / b;
}

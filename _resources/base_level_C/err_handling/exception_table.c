#include "exception_table.h"

static jmp_buf* curr_context = NULL; // Var for return in associated memory in stack

// TRY|CATCH macroses

#define TRY do { \
    jmp_buf _buf; \
    jmp_buf* _prev = curr_context; \
    curr_context = &_buf; \
    if (setjmp(_buf) == 0) {

#define CATCH(int) \
    } else { \
        curr_context = _prev; \

#define FINALLY \
        } \
        curr_context = _prev; \
    } while(0);


int main() {
    int err = 0;
    TRY {
        printf("Try block\n");
    } CATCH(err) {
        printf("Caught error\n");
    } FINALLY {
        if (err==0){
        printf("No exception");
    }
    }
}
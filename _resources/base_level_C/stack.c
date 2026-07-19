#include <stdio.h>
#include <stdbool.h>

#define MAX 100

const void* stack[MAX];
int top = -1;

bool _is_empty() {
    if (top == -1) {
        printf("Empty stack\n");
        return true;
    }
    return false;
}

bool _is_full() {
    if (top >= MAX-1) {
        printf("Stack full!\n");
        return true;
    }
    return false;
}

void push(const void* data) {
    if (_is_full()) {
        return;
    }
    top++;
    stack[top] = data;
    printf("added: %s\n", data);
}

void* pop() {
    
    if (_is_empty()) {
        return NULL;
    }
    void* data = stack[top]; 
    stack[top] = NULL;
    top--;
    printf("popped %s\n", data);
    return data;
}

void clear_stack() {
    while (!_is_empty())
    {
        pop();
    }
    return;
}

void* peek() {
    if (_is_empty()) {
        return NULL;
    }
    void* data = stack[top];
    printf("Top: %s\n", data);
    return data;
}


void print_stack() {
    if (_is_empty()){
        return;
    }
    int i = 0;
    int top_local = top;
    
    while (top_local >= i) {
        printf("%s\n", stack[top_local]);
        top_local--;
    }
}

int main() {
    _is_empty();

    push("H");
    push("e");
    push("l");
    push("l");
    push("o");
    print_stack();
    peek();
    printf("%d\n", _is_empty());
    pop();
    clear_stack();
    _is_empty();

    return 0;
}
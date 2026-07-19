#include <stdatomic.h>
#include <stdio.h>
#include <stdlib.h>
#include <threads.h>
#include <assert.h>


#define MAX 100


typedef struct Node { // Узел с данными и указателем на следующий узел для связности стека
    void* data;
    struct Node* next;
} node;


typedef struct { // Неатомарный указатель на node с счётчиком для избежения ABA
    node* ptr; 
    size_t counter;
} tagged_ptr;

_Atomic tagged_ptr head; // Атомарное начало стека - указатель на вершину

void stack_init() { // Резервируем память для первого элемента стэка
    tagged_ptr initial = {NULL, 0}; // Инициализируем указатель с счётчиком
    atomic_store(&head, initial); // Атомарная операция записи для инициализации начала стека
}

node* create_node(void* data) { // Создание узла.
    node* new_node = (node*)malloc(sizeof(node));//Инициализация узла с выделением памяти, возвращаем pointer на node.
    if (new_node) { // Если ячейка памяти не была занята
        new_node->data = data; // Записываем данные
        new_node->next = NULL; // Записываем NULL-поинтер
    }
    return new_node;
}

void push(void* data) {
    node* new_node = create_node(data); //Создаём узел с NULL-указателем на следующий node (Так как следующего узла попросту нет)
    if (!new_node) { //Не смогли создать узел
        printf("Ошибка выделения памяти!\n");
        return;
    }
    tagged_ptr old = atomic_load(&head); //Текущая вершина (Атомарное чтение)
    tagged_ptr desired; // Новая вершина (Записываем вместо NULL новый указатель)

    //CAS цикл
    do {
        new_node->next = old.ptr; //Указатель на старую вершину стека (Остаётся всегда на одном адресе!)
        
        desired.ptr = new_node; // Желаемое для CAS начало стека
        desired.counter = old.counter + 1; //Инкремент счётчика обращений
    } while (!atomic_compare_exchange_weak(&head, &old, desired)); // Не произошли ли изменения со старой вершиной
        printf("Push: %p (counter: %zu)\n", data, desired.counter);
}

void* pop() { // Взять с вершины стека
    tagged_ptr old = atomic_load(&head); // Загружаем адрес старой вершины
    tagged_ptr desired; // Желаемая новая вершина (указатель на следующий узел после удаляемого)
    node* popped_node; // Удаляемый узел

    do {
        if (old.ptr == NULL) {
            printf("Stack is empty\n");
            return NULL;
        } 
        
        popped_node = old.ptr; // Указываем на старый узел
        desired.ptr = popped_node->next; // Указатель на узел новой вершины (Для CAS)
        desired.counter = old.counter+1; // Увеличиваем счётчик
    } while (!atomic_compare_exchange_weak(&head, &old, desired)); // Проверяем, не изменилась ли вершина

    void* data = popped_node->data;
    printf("Popped data %p, counter %zu\n", data, old.counter);
    free(popped_node); // Удаляем структуру
    return data;
}

int main() {
    stack_init();
    push("A");
    pop();
    push("B");
    pop();
    push("A");
    return 0;
}
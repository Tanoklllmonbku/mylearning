#include <stdatomic.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

atomic_int global_value;
atomic_int min_value;

void atomic_multiply(atomic_int* val, int multiplier) {
    int old = atomic_load(val);
    int new_val;

    do {
        new_val = old * multiplier;
    } while (!atomic_compare_exchange_strong(val, &old, new_val));
    // Если CAS не удался, old автоматически обновился текущим значением
    // и цикл повторяется с новым old
}

void atomic_min(atomic_int* val, int candidate) {
    int old = atomic_load(val);

    while (candidate < old) {
        if (atomic_compare_exchange_strong(val, &old, candidate)) {
            break; // Успешно установили минимум
        }
        // Если CAS не удался, old обновился и продолжаем
    }
}

int main() {
    
    return 0;
}

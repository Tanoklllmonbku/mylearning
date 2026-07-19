#include "logging.h"

int main() {
    logging_init("log.log");
    LOG_INFO("Hello!");
    LOG_INFO("Veeeeeeeeeeeeeery long record!!!!");
    logging_shutdown();
    return 0;
}
#include <stdio.h>
#include <time.h>

int main(void) {
    struct tm *today = &(struct tm){
        .tm_year = 2024 - 1900,
        .tm_mon = 10 - 1,
        .tm_mday = 4,
    };

    mktime(today);
    auto buffer = (char[42]){};
    strftime(buffer, 42, "%A, %F", today);
    puts(buffer);
}

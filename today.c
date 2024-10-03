#include <stdio.h>
#include <time.h>

int main(void) {
    struct tm *today = &(struct tm){
        .tm_year = 2024 - 1900,
        .tm_mon = 10 - 1,
        .tm_mday = 3,
    };

    mktime(today);
    auto buffer = (char[21]){};
    strftime(buffer, 21, "%A, %F", today);
    puts(buffer);
}

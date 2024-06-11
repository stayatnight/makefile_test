#include <stdio.h>
#include"hello.h"
#include"say_you/SayYou.h"
int main() {
    const char *str = "zhou";
    printf("Hello, World!\n");
    hello(str);
    SayYou(str);
    return 0;
}

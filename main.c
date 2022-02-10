#include <stdio.h>

#include "is_on.h"

int main(int argc, char *argv[]) {
    printf("is it on? %s", is_on(true) ? "true" : "false");
}

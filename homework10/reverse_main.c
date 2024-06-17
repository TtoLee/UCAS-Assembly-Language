#include <stdio.h>
#include <stdint.h>
extern void reverse(int* a, int length);

int main(int argc, char** argv) {
    int array[10] = {40,81,53,8,64,75,12,26,97,39,};
    reverse(array, 10);
    for (int i = 0; i < 10; i++) {
        printf("%d,", array[i]);
    }
    printf("\n");
    return 0;
}

#include <stdio.h>
#include <stdint.h>
extern void hex2dec(uint32_t n);

int main(int argc, char** argv) {
    hex2dec(0x9812abcd);
    printf("\n");
    hex2dec(0x0fff);
    printf("\n");
    return 0;
}

#include <stdio.h>
#include <string.h>

unsigned int shld5(unsigned int a, unsigned int b);

int main() {
    unsigned int a = 0x12345678;
    unsigned int b = 0x87654321;
    printf("a: 0x%08x, b: 0x%08x, expected result: 0x%08x\n", 
            a, b, (a << 5) |( b>>(32-5)));
    unsigned int result = shld5(a, b);
    printf("Actual: result: 0x%08x\n", result);
    return 0;
}

unsigned int shld5(unsigned int a, unsigned int b) {    

         unsigned int result; 

        __asm__ volatile (
            "movl %1, %%ebx\n\t"
            "movl %2, %%edi\n\t"
            "shl $5, %%ebx\n\t"
            "shr $27, %%edi\n\t"
            "or %%ebx, %%edi\n\t"
            "movl %%edi, %0\n\t"
            : "=r" (result)
            : "r" (a), "r" (b)
            : "%ebx", "%edi"
        );
        return result;
}
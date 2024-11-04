#include <stdio.h>

void f0() {
    return;
}

void f1(int i) {
    return;
}

int f2(int i) {
    return i + 1;
}

int f3(int i, int j) {
    return i + j;
}

int main() {
    register long long rax asm("rax");
    register long long rdi asm("rdi");
    register long long rsi asm("rsi");

    asm("mov $14, %rax");
    printf("rax=%lld\n", rax);

    asm("mov $12, %rax");
    printf("rax=%lld\n", rax);

    asm("call f0");
    printf("rax=%lld\n", rax);

    asm("mov $12, %rdi; call f1;");
    printf("rax=%lld\n", rax);

    asm("mov $45, %rdi; call f2;");
    printf("rax=%lld\n", rax);

    asm("mov $45, %rdi; mov $7, %rsi; call f3;");
    printf("rax=%lld\n", rax);

    rdi = 2;
    rsi = 7;
    asm("call f3;");
    printf("rax=%lld\n", rax);

    return 0;
}
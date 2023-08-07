#include <stdio.h>

// s0 -> i
// s1 -> a
// s2 -> base address of b

void main() {
    int i, a = 7, b[3];         // initialization

    for (i = 0; i < 3; i++) {

    b[i] = a + (i * a);         // action performed to fill b

    }
}
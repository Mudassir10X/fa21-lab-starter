#include "transpose.h"

/* The naive transpose function as a reference. */
void transpose_naive(int n, int blocksize, int *dst, int *src) {
    for (int x = 0; x < n; x++) {
        for (int y = 0; y < n; y++) {
            dst[y + x * n] = src[x + y * n];
        }
    }
}

/* Implement cache blocking below. You should NOT assume that n is a
 * multiple of the block size. */
void transpose_blocking(int n, int blocksize, int *dst, int *src) {
    // YOUR CODE HERE
    for (int a = 0; a < n; a += blocksize) {
        for (int b = 0; b < n; b += blocksize) {
            for (int x = a; x < a + blocksize && x < n; x++) {
                for (int y = b; y < b + blocksize && y < n; y++) {
                    dst[y + x * n] = src[x + y * n];
                }
            }
        }
    }
}

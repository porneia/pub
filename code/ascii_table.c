#include <stdio.h>
#include <stdlib.h>

int main() {
    int i,j;

    for (i=4; i<16; i++) {
        for (j=0; j<8; j++) {
            printf("%3d %c  ",i*8+j,i*8+j);
        }
        printf("\n");
    }
    return 0;
}

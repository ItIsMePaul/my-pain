#include <stdio.h>
#include <stdlib.h>

int comp(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

int fillCups(int* amount, int amountSize) {
  qsort(amount, amountSize, sizeof(amount[0]), comp);
  if (amount[0] + amount[1] <= amount[2]) {
    return amount[2];
  }
  if (amount[0] + amount[1] > amount[2]) {
    return amount[2] + ceil((amount[1] + amount[0] - amount[2]) / 2.0);
  }
  return 0;
}
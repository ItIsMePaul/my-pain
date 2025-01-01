class Solution {
  int kthFactor(int n, int k) {
    int i = 1;
    int index = 0;
    while (i <= n) {
      if (n % i == 0) {
        index++;
        if (index == k) {
          return i;
        }
      }
      i++;
    }
    return -1;
  }
}

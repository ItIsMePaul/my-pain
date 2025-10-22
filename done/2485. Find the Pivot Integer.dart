class Solution {
  int pivotInteger(int n) {
    int right = 0;
    int left = n;
    for (var i = 1; i <= n; i++) right += i;
    if (right == left) return n;
    for (var i = n; i > 0; i--) {
      right -= i;
      left += (i - 1);
      if (right == left) return i;
    }
    return -1;
  }
}

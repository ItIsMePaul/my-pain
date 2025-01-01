class Solution {
  bool isBalanced(String num) {
    int odd = 0;
    int even = 0;
    for (var i = 0; i < num.length; i++) {
      if (i % 2 == 1) {
        odd += int.parse(num[i]);
      } else {
        even += int.parse(num[i]);
      }
    }
    return odd == even;
  }
}

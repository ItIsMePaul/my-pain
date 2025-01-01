class Solution {
  List<int> sumZero(int n) {
    List<int> ans = [];
    for (var i = 1; i <= n ~/ 2; i++) {
      ans.add(i);
      ans.add(-i);
    }
    if (n % 2 == 1) ans.add(0);

    return ans;
  }
}

class Solution {
  int minPartitions(String n) {
    int ans = 0;
    for (var i = 0; i < n.length; i++) {
      int temp = int.parse(n[i]);
      if (temp > ans) {
        ans = temp;
      }
    }
    return ans;
  }
}

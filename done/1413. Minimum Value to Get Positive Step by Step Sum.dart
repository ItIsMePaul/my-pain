class Solution {
  int minStartValue(List<int> nums) {
    int ans = 1;

    while (true) {
      int temp = ans;
      for (var num in nums) {
        temp += num;
        if (temp < 1) {
          ans++;
          break;
        }
      }
      if (temp < 1) {
        continue;
      } else {
        break;
      }
    }
    return ans;
  }
}

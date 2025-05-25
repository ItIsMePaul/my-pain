class Solution {
  int maxOperations(List<int> nums) {
    int ans = 1;
    int score = nums.removeAt(1) + nums.removeAt(0);
    while (nums.isNotEmpty) {
      int temp = nums.removeAt(1) + nums.removeAt(0);
      if (temp == score) {
        ans++;
      } else {
        break;
      }
    }
    return ans;
  }
}

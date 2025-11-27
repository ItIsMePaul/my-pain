class Solution {
  int findMaxConsecutiveOnes(List<int> nums) {
    int temp = 0;
    int result = 0;
    for (var n in nums) {
      if (n == 1) {
        temp++;
      } else {
        if (temp > result) result = temp;
        temp = 0;
      }
    }
    if (temp > result) result = temp;
    return result;
  }
}

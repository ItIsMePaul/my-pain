class Solution {
  int sumOfUnique(List<int> nums) {
    int result = 0;
    for (var e in nums.toSet()) {
      nums.remove(e);
      if (!nums.contains(e)) {
        result += e;
      }
    }
    return result;
  }
}

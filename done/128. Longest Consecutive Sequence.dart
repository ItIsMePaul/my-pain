class Solution {
  int longestConsecutive(List<int> nums) {
    Set<int> numsSet = nums.toSet();
    int result = 0;
    for (var n in numsSet) {
      if (!numsSet.contains(n - 1)) {
        int temp = 1;
        while (numsSet.contains(n + temp)) temp++;
        result = result > temp ? result : temp;
      }
    }
    return result;
  }
}

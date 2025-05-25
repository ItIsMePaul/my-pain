class Solution {
  int countCompleteSubarrays(List<int> nums) {
    int count = 0;
    Map<int, int> map = {};
    for (var num in nums) map[num] = (map[num] ?? 0) + 1;
    for (var i = map.length; i <= nums.length; i++) {
      Map<int, int> tMap = {};
      for (var j = 0; j < i; j++) tMap[nums[j]] = (tMap[nums[j]] ?? 0) + 1;
      if (tMap.length == map.length) count++;
      for (var j = 1; j + i <= nums.length; j++) {
        tMap[nums[j - 1]] = tMap[nums[j - 1]]! - 1;
        if (tMap[nums[j - 1]]! <= 0) tMap.remove(nums[j - 1]);
        tMap[nums[j + i - 1]] = (tMap[nums[j + i - 1]] ?? 0) + 1;
        if (tMap.length == map.length) count++;
      }
    }
    return count;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.countCompleteSubarrays([1, 3, 1, 2, 2]));
  print(solution.countCompleteSubarrays([5, 5, 5, 5]));
}

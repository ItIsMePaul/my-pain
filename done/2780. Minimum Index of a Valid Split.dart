class Solution {
  int minimumIndex(List<int> nums) {
    int size = nums.length;
    Map<int, int> map = {};
    int dominantElementCount = -1;
    int dominantElement = -1;
    for (var i = 0; i < size; i++) {
      map[nums[i]] = (map[nums[i]] ?? 0) + 1;
      if (map[nums[i]]! > dominantElementCount) {
        dominantElementCount = map[nums[i]]!;
        dominantElement = nums[i];
      }
    }
    List<int> sum = List.filled(nums.length, 0);
    int count = 0;
    for (var i = 0; i < size; i++) {
      if (nums[i] == dominantElement) count++;
      sum[i] = count;
    }
    for (var i = 1; i < size; i++) {
      if (sum[i - 1] * 2 > i && (count - sum[i - 1]) * 2 > size - i)
        return i - 1;
    }
    return -1;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.minimumIndex([1, 2, 2, 2])); // Output: 3
}

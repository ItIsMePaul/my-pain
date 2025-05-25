class Solution {
  int largestInteger(List<int> nums, int k) {
    Map<int, int> map = {};
    for (var i = 0; i < nums.length - k; i++) {
      Set<int> set = {};
      for (var j = i; j <= i + k; j++) {
        set.add(nums[j]);
      }
      for (var value in set) {
        map[value] = (map[value] ?? 0) + 1;
      }
    }
    int ans = -1;
    int freq = map.values.first;
    for (var key in map.keys) {
      if (map[key]! <= freq && ans < key) {
        ans = key;
      }
    }
    return ans;
  }
}

void main() {
  var nums = [0,0];
  var k = 0;
  print(Solution().largestInteger(nums, k)); // 5
}
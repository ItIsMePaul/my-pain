class Solution {
  int sumDivisibleByK(List<int> nums, int k) {
    Map<int, int> frequencyMap = {};
    int sum = 0;
    for (var num in nums) frequencyMap[num] = (frequencyMap[num] ?? 0) + 1;
    for (var key in frequencyMap.keys)  if (frequencyMap[key]! % k == 0) sum += key * frequencyMap[key]!;
    return sum;
  }
}

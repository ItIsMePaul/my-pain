class Solution {
  int maximumUniqueSubarray(List<int> nums) {
    int currentValue = 0;
    int maxValue = 0;
    Map<int, int> memory = {};
    int fast = 0;
    int slow = 0;
    while (fast < nums.length) {
      memory[nums[fast]] = (memory[nums[fast]] ?? 0) + 1;
      if (memory[nums[fast]]! > 1) {
        memory[nums[fast]] = (memory[nums[fast]] ?? 0) - 1;
        memory[nums[slow]] = (memory[nums[slow]] ?? 0) - 1;
        currentValue -= nums[slow++];
      } else {
        currentValue += nums[fast];
        if (currentValue > maxValue) {
          maxValue = currentValue;
        }
        fast++;
      }
    }
    return maxValue;
  }
}

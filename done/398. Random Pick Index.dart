import 'dart:math';

class Solution {
  Map<int, List<int>> memory = {};
  Solution(List<int> nums) {
    for (var i = 0; i < nums.length; i++) {
      memory[nums[i]] = [...(memory[nums[i]] ?? []), i];
    }
  }

  int pick(int target) {
    return memory[target]![Random().nextInt(memory[target]!.length)];
  }
}

/**
 * Your Solution object will be instantiated and called as such:
 * Solution obj = Solution(nums);
 * int param1 = obj.pick(target);
 */

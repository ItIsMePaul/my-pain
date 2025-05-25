class Solution {
  late List<int> original;
  late List<int> array;
  Solution(List<int> nums) {
    original = List.from(nums);
    array = List.from(nums);
  }

  List<int> reset() {
    array = List.from(original);
    return array;
  }

  List<int> shuffle() {
    array.shuffle();
    return array;
  }
}

/**
 * Your Solution object will be instantiated and called as such:
 * Solution obj = Solution(nums);
 * List<int> param1 = obj.reset();
 * List<int> param2 = obj.shuffle();
 */

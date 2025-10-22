class Solution {
  List<int> arrayChange(List<int> nums, List<List<int>> operations) {
    Map<int, int> map = {};
    for (var i = 0; i < nums.length; i++) map[nums[i]] = i;
    for (var operation in operations) {
      int position = map[operation[0]]!;
      nums[position] = operation[1];
      map.remove(operation[0]);
      map[operation[1]] = position;
    }
    return nums;
  }
}

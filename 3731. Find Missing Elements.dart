class Solution {
  List<int> findMissingElements(List<int> nums) {
    nums.sort();
    List<int> result = [];
    for (var i = 0; i < nums.length - 1; i++) {
      int temp = nums[i];
      while (nums[i + 1] - temp != 1) {
        temp++;
        result.add(temp);
      }
    }
    return result;
  }
}

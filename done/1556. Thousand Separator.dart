class Solution {
  String thousandSeparator(int n) {
    List<String> nums = n.toString().split('');
    List<String> result = [];
    int count = 0;
    for (var i = nums.length - 1; i >= 0; i--) {
      if (count == 3) {
        result.insert(0, '.');
        result.insert(0, nums[i]);
        count = 1;
      } else {
        result.insert(0, nums[i]);
        count++;
      }
    }
    return result.join('');
  }
}

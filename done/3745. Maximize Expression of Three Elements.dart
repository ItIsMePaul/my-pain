class Solution {
  int maximizeExpressionOfThree(List<int> nums) {
    List<int> values = [];
    bool smallestFound = false;
    for (var i = 0; i < 3; i++) {
      int position = 0;
      int value = nums.first;
      for (var j = 0; j < nums.length; j++) {
        if (smallestFound) {
          if (value < nums[j]) {
            value = nums[j];
            position = j;
          }
        } else {
          if (value > nums[j]) {
            value = nums[j];
            position = j;
          }
        }
      }
      values.add(value);
      nums.removeAt(position);
      smallestFound = true;
    }
    return values[1] + values[2] - values[0];
  }
}

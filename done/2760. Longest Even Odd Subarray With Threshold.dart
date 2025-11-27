class Solution {
  int longestAlternatingSubarray(List<int> nums, int threshold) {
    int result = 0;
    for (var i = 0; i < nums.length; i++) {
      if (nums[i] % 2 == 0 && nums[i] <= threshold) {
        int temp = 1;
        int index = i;
        while (index < nums.length - 1 && nums[index + 1] <= threshold) {
          if (nums[index] % 2 != nums[index + 1] % 2) {
            temp++;
            index++;
          } else {
            break;
          }
        }
        i = index;
        if (temp > result) {
          result = temp;
          temp = 1;
        }
      }
    }
    return result;
  }
}

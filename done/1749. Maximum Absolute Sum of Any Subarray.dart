class Solution {
  int maxAbsoluteSum(List<int> nums) {
    List<int> arr = [nums.first];
    int max = nums.first;
    for (var i = 1; i < nums.length; i++) {
      for (var j = 0; j < arr.length; j++) {
        arr[j] += nums[i];
        if (arr[j] > max) max = arr[j];
      }
      arr.add(nums[i]);
      if (nums[i] > max) max = nums[i];
    }
    return max;
  }
}

const nums = [1, -3, 2, 3, -4];

void main() {
  print(Solution().maxAbsoluteSum(nums));
}

/// create array and integer value for storing max sum
/// add to array first element
/// then create for loop which starts from 1 to nums.length
/// add new value to each value in array and also add at the end the new value
/// also with each addition operation check if that value is new max

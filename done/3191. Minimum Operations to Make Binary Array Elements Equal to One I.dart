class Solution {
  int minOperations(List<int> nums) {
    List<int> invert(List<int> arr) {
      for (var i = 0; i < arr.length; i++) arr[i] = arr[i] == 0 ? 1 : 0;
      return arr;
    }

    int ans = 0;
    for (var i = 0; i < nums.length - 2; i++) {
      if (nums[i] == 0) {
        nums.replaceRange(i, i + 3, invert(nums.sublist(i, i + 3)));
        ans++;
      }
    }
    if (nums.contains(0)) {
      return -1;
    } else {
      return ans;
    }
  }
}

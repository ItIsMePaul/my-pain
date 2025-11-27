class Solution {
  int minimumRightShifts(List<int> nums) {
    bool isSorted(List<int> nums) {
      for (var i = 0; i < nums.length - 1; i++) {
        if (nums[i] > nums[i + 1]) {
          return false;
        }
      }
      return true;
    }

    List<int> rightShift(List<int> nums) {
      List<int> ans = [];
      ans.add(nums.last);
      ans.addAll(nums.sublist(0, nums.length - 1));
      return ans;
    }

    int ans = 0;
    while (!isSorted(nums) && ans < nums.length + 2) {
      nums = rightShift(nums);
      ans++;
    }

    return ans > nums.length ? -1 : ans;
  }
}

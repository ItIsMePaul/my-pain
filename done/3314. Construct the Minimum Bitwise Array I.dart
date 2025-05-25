class Solution {
  List<int> minBitwiseArray(List<int> nums) {
    List<int> ans = [];

    main:
    for (var i = 0; i < nums.length; i++) {
      for (var j = 1; j <= nums[i]; j++) {
        if (j | (j + 1) == nums[i]) {
          ans.add(j);
          continue main;
        }
      }
      ans.add(-1);
    }

    return ans;
  }
}

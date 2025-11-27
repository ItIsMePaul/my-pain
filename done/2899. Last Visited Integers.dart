class Solution {
  List<int> lastVisitedIntegers(List<int> nums) {
    List<int> seen = [], ans = [];
    int k = 0;
    for (var i = 0; i < nums.length; i++) {
      if (nums[i] == -1) {
        try {
          ans.add(seen[k]);
        } catch (e) {
          ans.add(-1);
        }
        k++;
      } else {
        seen.insert(0, nums[i]);
        k = 0;
      }
    }
    return ans;
  }
}

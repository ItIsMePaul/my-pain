class Solution {
  List<bool> checkArithmeticSubarrays(
      List<int> nums, List<int> l, List<int> r) {
    bool isArithmetic(List<int> arr) {
      if (arr.length <= 1) return true;
      int diff = arr[1] - arr[0];
      for (var i = 0; i < arr.length - 1; i++) {
        if (arr[i + 1] - arr[i] != diff) {
          return false;
        }
      }
      return true;
    }

    List<bool> ans = [];
    for (var i = 0; i < l.length; i++) {
      List<int> temp = nums.sublist(l[i], r[i] + 1)..sort();
      ans.add(isArithmetic(temp));
    }
    return ans;
  }
}

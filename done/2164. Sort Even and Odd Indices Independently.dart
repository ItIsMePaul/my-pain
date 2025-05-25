class Solution {
  List<int> sortEvenOdd(List<int> nums) {
    List<int> odd = [];
    List<int> even = [];
    for (var i = 0; i < nums.length; i++) {
      if (i % 2 == 0) {
        even.add(nums[i]);
      } else {
        odd.add(nums[i]);
      }
    }
    odd.sort((a, b) => b.compareTo(a));
    even.sort();
    List<int> res = [];
    bool Switch = false;
    while (odd.isNotEmpty || even.isNotEmpty) {
      if (Switch) {
        res.add(odd.removeAt(0));
        Switch = !Switch;
      } else {
        res.add(even.removeAt(0));
        Switch = !Switch;
      }
    }
    return res;
  }
}

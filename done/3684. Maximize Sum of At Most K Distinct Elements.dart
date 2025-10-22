class Solution {
  List<int> maxKDistinct(List<int> nums, int k) {
    Set<int> set = (nums..sort((a, b) => b.compareTo(a))).toSet();
    return set.toList().sublist(0, (set.length > k ? k : set.length));
  }
}

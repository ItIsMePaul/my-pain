class Solution {
  List<int> twoOutOfThree(List<int> nums1, List<int> nums2, List<int> nums3) {
    List<int> result = [];
    for (var e in nums1) {
      if ((nums2.contains(e) || nums3.contains(e)) && !result.contains(e)) {
        result.add(e);
      }
    }
    for (var e in nums2) {
      if ((nums1.contains(e) || nums3.contains(e)) && !result.contains(e)) {
        result.add(e);
      }
    }
    for (var e in nums3) {
      if ((nums1.contains(e) || nums2.contains(e)) && !result.contains(e)) {
        result.add(e);
      }
    }
    return result;
  }
}

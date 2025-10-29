class Solution {
  int minOperations(List<int> nums1, List<int> nums2) {
    int operations = 0;
    bool appended = false;
    int minDifference = (nums1.first - nums2.last).abs();
    for (var i = 0; i < nums1.length; i++) {
      if (!appended &&
          ((nums1[i] <= nums2.last && nums2.last <= nums2[i]) ||
              (nums1[i] >= nums2.last && nums2[i] <= nums2.last))) {
        operations++;
        appended = true;
      }
      operations += (nums1[i] - nums2[i]).abs();
      if (!appended) {
        int temp1 = (nums2.last - nums1[i]).abs();
        int temp2 = (nums2.last - nums2[i]).abs();
        minDifference = temp1 < temp2
            ? (minDifference < temp1 ? minDifference : temp1)
            : (minDifference < temp2 ? minDifference : temp2);
      }
    }
    if (!appended) {
      operations += minDifference + 1;
    }
    return operations;
  }
}
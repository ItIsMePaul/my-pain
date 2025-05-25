class Solution {
  bool canBeIncreasing(List<int> nums) {
    bool isSorted(List<int> arr) {
      for (var i = 0; i < arr.length - 1; i++) {
        if (arr[i] >= arr[i + 1]) {
          return false;
        }
      }
      return true;
    }

    for (var i = 0; i < nums.length; i++) {
      int temp = nums.removeAt(i);
      if (isSorted(nums)) {
        return true;
      }
      nums.insert(i, temp);
    }
    return false;
  }
}

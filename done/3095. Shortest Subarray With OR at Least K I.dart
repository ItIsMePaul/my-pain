class Solution {
  int minimumSubarrayLength(List<int> nums, int k) {
    int size = 50;
    for (var i = 0; i < nums.length; i++) {
      for (var j = i + 1; j < nums.length + 1; j++) {
        List<int> tempArray = nums.sublist(i, j);
        int temp = 0;
        for (var e in tempArray) {
          temp |= e;
        }
        if (temp > k && size >= tempArray.length) {
          size = tempArray.length;
        }
      }
    }
    return size == 50 ? -1 : size;
  }
}

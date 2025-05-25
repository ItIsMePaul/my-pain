class Solution {
  int peakIndexInMountainArray(List<int> arr) {
    int right = arr.length - 1;
    int left = 0;
    while (left < right) {
      int mid = left + (right - left) ~/ 2;
      if (arr[mid] < arr[mid + 1]) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    return left;
  }
}

class Solution {
  int maximumGap(List<int> nums) {
    int _getMax(List<int> arr) {
      int max = arr[0];
      for (var i = 1; i < arr.length; i++) if (arr[i] > max) max = arr[i];
      return max;
    }

    List<int> _radixSort(List<int> arr) {
      print(arr);
      List<List<int>> radixArray = [[], [], [], [], [], [], [], [], [], []];
      int max = _getMax(arr);
      int exp = 1;
      while ((max / exp).floor() > 0) {
        while (arr.length > 0) {
          int val = arr.removeLast();
          int radixIndex = (val / exp).floor() % 10;
          radixArray[radixIndex].add(val);
        }
        for (var bucket in radixArray) {
          while (bucket.length > 0) {
            int val = bucket.removeLast();
            arr.add(val);
          }
        }
        exp *= 10;
      }
      return arr;
    }

    nums = _radixSort(nums);
    int diff = 0;
    for (var i = 0; i < nums.length - 1; i++) {
      int temp = nums[i + 1] - nums[i];
      if (temp > diff) diff = temp;
    }
    return diff;
  }
}

class Solution {
  bool canMakeArithmeticProgression(List<int> arr) {
    arr.sort();
    int p = arr[1] - arr[0];
    for (var i = 1; i < arr.length - 1; i++) {
      if (arr[i] + p != arr[i + 1]) {
        return false;
      }
    }
    return true;
  }
}

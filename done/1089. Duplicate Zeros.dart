class Solution {
  void duplicateZeros(List<int> arr) {
    for (var i = 0; i < arr.length; i++) {
      if (arr[i] == 0) {
        arr.insert(i, 0);
        arr.removeAt(arr.length - 1);
        i++;
      }
    }
  }
}

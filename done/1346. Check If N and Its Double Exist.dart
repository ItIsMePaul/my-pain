class Solution {
  bool checkIfExist(List<int> arr) {
    for (var i = 0; i < arr.length - 1; i++) {
      for (var j = i + 1; j < arr.length; j++) {
        if (arr[i] == arr[j] * 2 || arr[j] == arr[i] * 2) {
          return true;
        }
      }
    }
    return false;
  }
}

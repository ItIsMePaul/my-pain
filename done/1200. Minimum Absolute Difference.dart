class Solution {
  List<List<int>> minimumAbsDifference(List<int> arr) {
    arr.sort();
    int minDiff = (arr[0] - arr[1]).abs();
    List<List<int>> ans = [];
    for (var i = 0; i < arr.length - 1; i++) {
      int temp = (arr[i + 1] - arr[i]).abs();
      if (minDiff > temp) {
        minDiff = temp;
        ans.clear();
        ans.add([arr[i], arr[i + 1]]);
        continue;
      }
      if (temp == minDiff) {
        ans.add([arr[i], arr[i + 1]]);
        continue;
      }
    }
    return ans;
  }
}

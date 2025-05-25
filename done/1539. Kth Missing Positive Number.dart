class Solution {
  int findKthPositive(List<int> arr, int k) {
    int ans = 0;
    int index = 0;
    while (index < k) {
      ans++;
      if (arr.isNotEmpty && arr[0] == ans) {
        arr.removeAt(0);
        continue;
      }
      index++;
    }
    return ans;
  }
}

class Solution {
  int tribonacci(int n) {
    List<int> arr = [0, 1, 1];
    if (arr.length > n) return arr[n];
    while (arr.length <= n) {
      int s = arr.length;
      arr.add(arr[s - 1] + arr[s - 2] + arr[s - 3]);
      arr.removeAt(0);
      n--;
    }
    return arr.last;
  }
}

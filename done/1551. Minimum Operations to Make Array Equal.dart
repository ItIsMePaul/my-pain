class Solution {
  int minOperations(int n) {
    List<int> arr = List.generate(n, (int index) => (2 * index) + 1);
    int ans = 0;
    print(arr);
    for (var i = 0; i < arr.length ~/ 2; i++) {
      while (arr[i] != arr[arr.length - 1 - i]) {
        ans++;
        arr[i]++;
        arr[arr.length - 1 - i]--;
      }
    }
    print(arr);
    return ans;
  }
}

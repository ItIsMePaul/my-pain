class Solution {
  int distinctIntegers(int n) {
    List<int> numbers = List.generate(n + 1, (int index) => index + 1);
    int ans = 0;
    for (var i = 1; i <= n; i++) {
      for (var j = 0; j < numbers.length; j++) {
        if (i % numbers[j] == 1) {
          numbers.removeAt(j);
          ans++;
        }
      }
    }
    return ans;
  }
}

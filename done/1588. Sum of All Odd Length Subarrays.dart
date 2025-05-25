class Solution {
  int sumOddLengthSubarrays(List<int> arr) {
    int ans = 0;
    int baseSize = 1;
    while (baseSize <= arr.length) {
      for (var i = 0; i <= arr.length - baseSize; i++) {
        ans += arr
            .sublist(i, i + baseSize)
            .fold(0, (previous, current) => previous + current);
      }
      baseSize += 2;
    }
    return ans;
  }
}

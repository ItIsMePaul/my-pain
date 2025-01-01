class Solution {
  int binaryGap(int n) {
    String binaryNumber = n.toRadixString(2);
    int ans = 0;
    int startPoint = 0;
    for (var i = 0; i < binaryNumber.length; i++) {
      if (startPoint != i && binaryNumber[i] == '1') {
        int temp = i - startPoint;
        ans = temp > ans ? temp : ans;
        startPoint = i;
      }
    }
    return ans;
  }
}

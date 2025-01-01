class Solution {
  String generateTheString(int n) {
    StringBuffer ans = StringBuffer();
    int a = n % 2 == 1 ? n : n - 1;
    int b = n % 2 == 1 ? 0 : 1;
    for (var i = 0; i < a; i++) {
      ans.write('a');
    }
    for (var i = 0; i < b; i++) {
      ans.write('b');
    }
    return ans.toString();
  }
}

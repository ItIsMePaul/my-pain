class Solution {
  String digitSum(String s, int k) {
    String newS = '';
    while (s.length > k) {
      newS = '';
      for (var i = 0; i < s.length; i += k) {
        int temp = 0;
        int edge = 0;
        if ((s.length - i) ~/ k > 0) {
          edge = k;
        } else {
          edge = (s.length - i) % k;
        }
        for (var e in s.substring(i, i + edge).split('')) {
          temp += int.parse(e);
        }
        newS += '$temp';
      }
      s = newS;
    }
    return s;
  }
}

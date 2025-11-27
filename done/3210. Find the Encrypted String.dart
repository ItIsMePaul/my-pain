class Solution {
  String getEncryptedString(String s, int k) {
    String result = '';
    if (k >= s.length) {
      k = k % s.length;
    }
    for (var i = 0; i < s.length; i++) {
      if ((i + k) >= s.length) {
        result += s[-1 * (s.length - (i + k))];
      } else {
        result += s[i + k];
      }
    }
    return result;
  }
}

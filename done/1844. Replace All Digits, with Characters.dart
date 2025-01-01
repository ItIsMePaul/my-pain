class Solution {
  String replaceDigits(String s) {
    int shift(String l, int n) {
      if (l.codeUnitAt(0) + n <= 122) {
        return l.codeUnitAt(0) + n;
      } else {
        return 97 + (122 - (l.codeUnitAt(0) + n));
      }
    }

    List<String> result = [];
    for (var i = 0; i < s.length - 1; i += 2) {
      result.add(s[i]);
      result.add(String.fromCharCode(shift(s[i], int.parse(s[i + 1]))));
    }
    if (s.length != result.length) {
      result.add(s[s.length - 1]);
    }
    return result.join('');
  }
}

class Solution {
  int myAtoi(String s) {
    s = s.trim();
    if (s.isEmpty) {
      return 0;
    }
    String ans = '';
    late int j;
    if (s[0] == '-' || s[0] == '+') {
      if (s[0] == '-') {
        ans = '-';
        j = 1;
      } else {
        ans = '';
        j = 1;
      }
    } else {
      ans = '';
      j = 0;
    }
    bool firstZeros = true;
    for (var i = j; i < s.length; i++) {
      if (firstZeros && s[i] == '0') {
        continue;
      } else {
        firstZeros = false;
      }
      if (s[i].codeUnits[0] >= 48 && s[i].codeUnits[0] <= 57) {
        ans += s[i];
        if (ans.length > 15) {
          break;
        }
      } else {
        break;
      }
    }
    int? temp = int.tryParse(ans);
    late int res;
    if (temp != null) {
      if (temp >= -2147483648 && temp <= 2147483647) {
        res = temp;
      } else {
        if (temp <= -2147483648) {
          res = -2147483648;
        } else {
          res = 2147483647;
        }
      }
    } else {
      res = 0;
    }
    return res;
  }
}

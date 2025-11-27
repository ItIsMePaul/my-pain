class Solution {
  String gcdOfStrings(String str1, String str2) {
    if (str1 + str2 != str2 + str1) {
      return '';
    }
    if (str1 == str2) {
      return str1;
    }
    String ans = '';
    if (str1.length > str2.length) {
      for (var i = str1.length ~/ 2; i >= 0; i--) {
        ans = str1.substring(0, i + 1);
        if (str2.length % ans.length == 0 && str1.length % ans.length == 0) {
          String temp = str2.substring(0, ans.length);
          if (ans == temp) {
            return ans;
          }
        }
      }
    } else {
      for (var i = str2.length ~/ 2; i >= 0; i--) {
        ans = str2.substring(0, i + 1);
        if (str2.length % ans.length == 0 && str1.length % ans.length == 0) {
          String temp = str1.substring(0, ans.length);
          if (ans == temp) {
            return ans;
          }
        }
      }
    }
    return ans;
  }
}

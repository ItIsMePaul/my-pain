class Solution {
  String licenseKeyFormatting(String s, int k) {
    StringBuffer ans = StringBuffer();
    int count = 0;
    for (var i = s.length - 1; i >= 0; i--) {
      if (s[i] != '-') {
        if (count > 0 && count % k == 0) {
          ans.write('-');
        }
        ans.write(s[i].toUpperCase());
        count++;
      }
    }
    return String.fromCharCodes(ans.toString().codeUnits.reversed);
  }
}

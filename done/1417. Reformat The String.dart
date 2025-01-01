class Solution {
  String reformat(String s) {
    if (s.length == 1) return s;
    List<String> nums = [];
    List<String> letters = [];
    for (var i = 0; i < s.length; i++) {
      int codeUnit = s[i].codeUnits[0];
      if (codeUnit >= 48 && codeUnit <= 57) {
        nums.add(s[i]);
      } else {
        letters.add(s[i]);
      }
    }
    if ((nums.isNotEmpty && letters.isNotEmpty) &&
        (nums.length == letters.length ||
            nums.length % letters.length == 1 ||
            letters.length % nums.length == 1)) {
      String ans = '';
      if (nums.length > letters.length) {
        while (nums.isNotEmpty) {
          ans += nums.removeLast();
          if (letters.isEmpty) break;
          ans += letters.removeLast();
        }
      } else {
        while (letters.isNotEmpty) {
          ans += letters.removeLast();
          if (nums.isEmpty) break;
          ans += nums.removeLast();
        }
      }
      return ans;
    } else {
      return '';
    }
  }
}

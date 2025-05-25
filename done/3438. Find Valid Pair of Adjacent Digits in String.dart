class Solution {
  String findValidPair(String s) {
    Map<String, int> map = {};
    for (var i = 0; i < s.length; i++) {
      map[s[i]] = (map[s[i]] ?? 0) + 1;
    }
    for (var i = 0; i < s.length - 1; i++) {
      String temp = s.substring(i, i + 2);
      if (temp[0] != temp[1] &&
          map[temp[0]] == int.parse(temp[0]) &&
          map[temp[1]] == int.parse(temp[1])) {
        return temp;
      }
    }
    return '';
  }
}

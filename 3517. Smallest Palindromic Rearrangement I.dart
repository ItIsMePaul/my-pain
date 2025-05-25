import 'dart:collection';

class Solution {
  String smallestPalindrome(String s) {
    SplayTreeMap<String, int> map = SplayTreeMap();
    String? middleChar;
    if (s.length % 2 == 1) middleChar = s[s.length ~/ 2];
    for (var i = 0; i < s.length; i++) {
      map[s[i]] = (map[s[i]] ?? 0) + 1;
    }
    StringBuffer result = StringBuffer();
    for (var key in map.keys) {
      result.write(key * (map[key]! ~/ 2));
    }
    result.write((middleChar ?? ''));
    for (var key in map.keys.toList().reversed) {
      result.write(key * (map[key]! ~/ 2));
    }
    return result.toString();
  }
}

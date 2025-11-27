class Solution {
  int minLengthAfterRemovals(String s) {
    Map<String, int> map = {'a': 0, 'b': 0};
    for (var i = 0; i < s.length; i++) {
      map[s[i]] = map[s[i]]! + 1;
    }
    return (map['a']! - map['b']!).abs();
  }
}

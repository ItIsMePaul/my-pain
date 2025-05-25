class Solution {
  List<String> findRepeatedDnaSequences(String s) {
    Map<String, int> map = {};
    List<String> result = [];
    for (var i = 0; i <= s.length - 10; i++) {
      String segment = s.substring(i, i + 10);
      map[segment] = (map[segment] ?? 0) + 1;
      if (map[segment] == 2) result.add(segment);
    }
    return result;
  }
}

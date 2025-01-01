class Solution {
  List<String> uncommonFromSentences(String s1, String s2) {
    List<String> sen1 = s1.split(' ');
    List<String> sen2 = s2.split(' ');
    Map<String, int> map = {};
    for (var word in sen1) map[word] = map[word] == null ? 1 : map[word]! + 1;

    for (var word in sen2) map[word] = map[word] == null ? 1 : map[word]! + 1;

    return map.entries
        .where((entry) => entry.value == 1)
        .map((entry) => entry.key)
        .toList();
  }
}

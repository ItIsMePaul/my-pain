class Solution {
  String truncateSentence(String s, int k) {
    List<String> splits = s.split(' ');
    List<String> result = [];
    for (var i = 0; i < k; i++) {
      result.add(splits[i]);
    }
    return result.join(' ');
  }
}

class Solution {
  String removeDuplicatesII(String s) {
    List<String> ss = s.split('');
    for (var i = 0; i < ss.length - 1; i++) {
      if (i < 0) {
        continue;
      }
      if (ss[i] == ss[i + 1]) {
        ss.removeAt(i);
        ss.removeAt(i);
        i = i - 2;
      }
    }
    return ss.join('');
  }
}

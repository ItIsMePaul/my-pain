class Solution {
  bool hasSpecialSubstring(String s, int k) {
    List<String> list = s.split('');
    for (var i = 0; i <= list.length - k; i++) {
      List<String> window = list.sublist(i, i + k);
      if (window.toSet().length == 1) {
        String char = window.first;
        if ((i - 1 < 0 || list[i - 1] != char) &&
            (i + k >= list.length || list[i + k] != char)) {
          return true;
        }
      }
    }
    return false;
  }
}

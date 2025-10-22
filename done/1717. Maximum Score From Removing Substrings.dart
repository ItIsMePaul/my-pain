class Solution {
  int maximumGain(String s, int x, int y) {
    int pointCounter(String pattern, int point) {
      List<String> list = [];
      int pointCount = 0;
      for (var i = 0; i < s.length; i++) {
        if (list.isNotEmpty && list.last == pattern[0] && s[i] == pattern[1]) {
          pointCount += point;
          list.removeLast();
        } else {
          list.add(s[i]);
        }
      }
      s = list.join();
      return pointCount;
    }

    int point = 0;
    if (x > y) {
      point += pointCounter('ab', x);
      point += pointCounter('ba', y);
    } else {
      point += pointCounter('ba', y);
      point += pointCounter('ab', x);
    }
    return point;
  }
}

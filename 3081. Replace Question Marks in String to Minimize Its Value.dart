class Solution {
  String minimizeStringValue(String s) {
    int _smallestNumber(List<int> list) {
      int pos = 0;
      for (var i = 0; i < list.length; i++) {
        if (list[i] < list[pos]) pos = i;
      }
      return pos;
    }

    List<int> list = List.filled(26, 0);
    for (var i = 0; i < s.length; i++) {
      if (s[i] != '?') {
        list[s[i].codeUnits[0] - 97]++;
      }
    }
    List<String> sortedChar = [];
    StringBuffer result = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      if (s[i] == '?') {
        int pos = _smallestNumber(list);
        String char = String.fromCharCode(pos + 97);
        list[pos]++;
        sortedChar.add(char);
      }
    }
    sortedChar.sort((a, b) => b.compareTo(a));
    for (var i = 0; i < s.length; i++) {
      if (s[i] == '?') {
        result.write(sortedChar.removeLast());
      } else {
        result.write(s[i]);
      }
    }
    return result.toString();
  }
}

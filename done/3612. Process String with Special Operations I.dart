class Solution {
  String processStr(String s) {
    List<String> result = [];
    for (var i = 0; i < s.length; i++) {
      switch (s[i]) {
        case '*':
          if (result.isNotEmpty) result.removeLast();
          break;
        case '#':
          if (result.isNotEmpty) result.addAll(List.from(result));
          break;
        case '%':
          if (result.isNotEmpty) result = result.reversed.toList();
          break;
        default:
          result.add(s[i]);
      }
    }
    return result.join('');
  }
}

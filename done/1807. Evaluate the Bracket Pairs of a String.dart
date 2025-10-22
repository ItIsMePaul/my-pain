class Solution {
  String evaluate(String s, List<List<String>> knowledge) {
    Map<String, String> dictionary = Map.fromIterable(
      knowledge,
      key: (item) => item[0],
      value: (item) => item[1],
    );
    StringBuffer result = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        int index = s.indexOf(')');
        String? word = dictionary[s.substring(i + 1, index)];
        result.write(word ?? '?');
        s = s.substring(index + 1);
        i = -1;
      } else {
        result.write(s[i]);
      }
    }
    return result.toString();
  }
}

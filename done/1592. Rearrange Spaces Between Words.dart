class Solution {
  String reorderSpaces(String text) {
    int spaces = 0;
    List<String> words = [];
    StringBuffer temp = StringBuffer();
    for (var i = 0; i < text.length; i++) {
      if (text[i] == ' ') {
        spaces++;
        if (temp.isNotEmpty) {
          words.add(temp.toString());
          temp.clear();
        }
      } else {
        temp.write(text[i]);
      }
    }
    if (temp.isNotEmpty) words.add(temp.toString());

    if (words.isEmpty || spaces == 0) return text;
    if (words.length == 1) return words[0] + ' ' * spaces;

    int gap = spaces ~/ (words.length - 1);
    int rem = spaces % (words.length - 1);

    StringBuffer ans = StringBuffer(words.first);
    for (var i = 1; i < words.length; i++) {
      ans.write(' ' * gap);
      ans.write(words[i]);
    }
    ans.write(' ' * rem);
    return ans.toString();
  }
}

class Solution {
  String addSpaces(String s, List<int> spaces) {
    final buffer = StringBuffer();
    for (var i = 0; i < spaces.length; i++) {
      if (i == 0) {
        buffer.write(s.substring(0, spaces[i]));
        buffer.write(' ');
      } else {
        buffer.write(s.substring(spaces[i - 1], spaces[i]));
        buffer.write(' ');
      }
    }
    buffer.write(s.substring(spaces.last));
    return buffer.toString();
  }
}

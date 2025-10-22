class Solution {
  String generateTag(String caption) {
    StringBuffer tag = StringBuffer('#');
    List<String> words = caption.trim().split(' ');
    tag.write(words.first.toLowerCase());
    for (var i = 1; i < words.length && tag.length <= 100; i++) {
      if (words[i].isNotEmpty) {
        tag.write(words[i][0].toUpperCase());
        tag.write(words[i].substring(1).toLowerCase());
      }
    }
    if (tag.length > 100) {
      return tag.toString().substring(0, 100);
    }
    return tag.toString();
  }
}

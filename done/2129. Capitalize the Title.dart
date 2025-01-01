class Solution {
  String capitalizeTitle(String title) {
    List<String> words = title.split(' ');
    List<String> result = [];
    for (var i = 0; i < words.length; i++) {
      String word = '';
      if (words[i].split('').length <= 2) {
        word = words[i].toLowerCase();
      } else {
        for (var j = 0; j < words[i].split('').length; j++) {
          if (j == 0) {
            word += words[i].split('')[j].toUpperCase();
          } else {
            word += words[i].split('')[j].toLowerCase();
          }
        }
      }
      result.add(word);
    }
    return result.join(' ');
  }
}

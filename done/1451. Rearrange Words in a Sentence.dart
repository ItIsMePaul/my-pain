import 'dart:collection';

class Solution {
  String arrangeWords(String text) {
    SplayTreeMap<int, List<String>> map = SplayTreeMap();
    for (var word in text.split(' ')) {
      if (map.containsKey(word.length)) {
        map[word.length]!.add(word.toLowerCase());
      } else {
        map[word.length] = [word.toLowerCase()];
      }
    }
    bool isFirstWord = true;
    List<String> words = [];
    for (var key in map.keys) {
      for (var word in map[key]!) {
        if (isFirstWord) {
          isFirstWord = false;
          word = word[0].toUpperCase() + word.substring(1);
          words.add(word);
        } else {
          words.add(word);
        }
      }
    }
    return words.join(' ');
  }
}

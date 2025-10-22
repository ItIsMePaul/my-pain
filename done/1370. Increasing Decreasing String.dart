import 'dart:collection';

class Solution {
  String sortString(String s) {
    SplayTreeMap<String, int> map = SplayTreeMap();

    for (var i = 0; i < s.length; i++) map[s[i]] = (map[s[i]] ?? 0) + 1;

    bool cycle = true;
    Set<String> letters = map.keys.toSet();
    int index = 0;
    StringBuffer result = StringBuffer();

    while (map.isNotEmpty) {
      String letter = letters.elementAt(index);
      if (cycle) {
        result.write(letter);
        map[letter] = map[letter]! - 1;
        if (map[letter] == 0) {
          map.remove(letter);
          letters.remove(letter);
          index--;
        }
        index++;
        if (letters.length == index) {
          cycle = !cycle;
          index = letters.length - 1;
        }
      } else {
        result.write(letter);
        map[letter] = map[letter]! - 1;
        if (map[letter] == 0) {
          map.remove(letter);
          letters.remove(letter);
        }
        index--;
        if (index == -1) {
          cycle = !cycle;
          index = 0;
        }
      }
    }
    return result.toString();
  }
}

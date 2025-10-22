import 'dart:collection';

class Solution {
  String sortVowels(String s) {
    Set<String> vowels = {'a', 'e', 'i', 'o', 'u'};
    SplayTreeMap<String, int> countVowels = SplayTreeMap();
    for (var i = 0; i < s.length; i++) {
      if (vowels.contains(s[i].toLowerCase())) {
        countVowels[s[i]] = (countVowels[s[i]] ?? 0) + 1;
      }
    }
    StringBuffer result = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      if (vowels.contains(s[i].toLowerCase())) {
        String letter = countVowels.firstKey()!;
        result.write(letter);
        countVowels[letter] = countVowels[letter]! - 1;
        if (countVowels[letter] == 0) {
          countVowels.remove(letter);
        }
      } else {
        result.write(s[i]);
      }
    }
    return result.toString();
  }
}

class Solution {
  int similarPairs(List<String> words) {
    int result = 0;
    for (var i = 0; i < words.length; i++) {
      Set<String> word1 = words[i].split('').toSet();
      for (var j = i + 1; j < words.length; j++) {
        Set<String> word2 = words[j].split('').toSet();
        if (word1.length == word2.length) {
          Set<String> commonLetters = word1.intersection(word2);
          if (commonLetters.length == word1.length &&
              commonLetters.length == word2.length) {
            result++;
          }
        }
      }
    }
    return result;
  }
}

class Solution {
  bool arrayStringsAreEqual(List<String> word1, List<String> word2) {
    String joinedWord =
        word1.length < word2.length ? word1.join('') : word2.join('');
    for (var word in word1.length < word2.length ? word2 : word1) {
      if (!joinedWord.contains(word)) {
        return false;
      } else {
        joinedWord = joinedWord.replaceFirst(word, '');
      }
    }
    return joinedWord.isEmpty;
  }
}

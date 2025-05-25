class Solution {
  bool reportSpam(List<String> message, List<String> bannedWords) {
    Set<String> banWords = bannedWords.toSet();
    int count = 0;
    for (var word in message) {
      if (banWords.contains(word)) {
        count++;
        if (count > 1) {
          return true;
        }
      }
    }
    return false;
  }
}

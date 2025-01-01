class Solution {
  String reversePrefix(String word, String ch) {
    List<String> sWord = word.split('');
    String result = '';
    if (!sWord.contains(ch)) {
      return word;
    } else {
      int m = 0;
      for (var i = 0; i < sWord.length; i++) {
        if (sWord[i].codeUnits[0] == ch.codeUnits[0]) {
          m = i;
          break;
        }
      }
      for (var i = m; i >= 0; i--) {
        result += sWord[i];
      }
      for (var i = m + 1; i < sWord.length; i++) {
        result += sWord[i];
      }
    }
    return result;
  }
}

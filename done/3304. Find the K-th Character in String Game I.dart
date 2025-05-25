class Solution {
  String kthCharacter(int k) {
    String word = 'a';
    while (word.length < k) {
      List<int> charCodes = word.codeUnits.toList();
      for (var i = 0; i < charCodes.length; i++) {
        charCodes[i]++;
        if (charCodes[i] > 122) charCodes[i] = 97;
      }
      word = word + String.fromCharCodes(charCodes);
    }
    return word[k - 1];
  }
}

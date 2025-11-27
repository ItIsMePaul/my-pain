class Solution {
  bool isValid(String word) {
    if (word.length < 3) return false;
    word = word.toLowerCase();
    bool containNumber = false, containVowel = false, containConsonant = false;
    List<String> sWord = word.split('');
    List<String> vowelLetters = ['a', 'e', 'i', 'o', 'u'];
    for (var e in sWord) {
      if (containNumber && containVowel && containConsonant) {
        return true;
      }
      int symbolCode = e.codeUnits[0];
      if (symbolCode >= 48 && symbolCode <= 57) {
        containNumber = true;
        continue;
      }
      if (symbolCode >= 97 && symbolCode <= 122) {
        if (vowelLetters.contains(e)) {
          containVowel = true;
        } else {
          containConsonant = true;
        }
        continue;
      } else {
        return false;
      }
    }
    if (containVowel && containConsonant) {
      return true;
    }
    return false;
  }
}

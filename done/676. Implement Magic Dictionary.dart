class MagicDictionary {
  Map<int, List<String>> dict = {};
  MagicDictionary() {}

  void buildDict(List<String> dictionary) {
    for (var word in dictionary) {
      dict[word.length] = [...dict[word.length] ?? [], word];
    }
  }

  bool search(String searchWord) {
    if (!dict.containsKey(searchWord.length)) return false;
    for (var word in dict[searchWord.length]!) {
      if (word.length == searchWord.length) {
        int changedLetters = 0;
        for (var i = 0; i < word.length; i++) {
          if (word[i] != searchWord[i]) changedLetters++;
        }
        if (changedLetters == 1) return true;
      }
    }
    return false;
  }
}

void main() {
  MagicDictionary magicDictionary = MagicDictionary();
  magicDictionary.buildDict(["hello", "leetcode"]);
  print(magicDictionary.search("hhllo")); // true
  print(magicDictionary.search("leetcoded")); // false
  print(magicDictionary.search("leetcoder")); // false
  print(magicDictionary.search("leetcod")); // false
  print(magicDictionary.search("leetcodr")); // true
}

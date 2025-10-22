class WordDictionary {
  Map<int, List<String>> _dictionary = {}; // length: []
  WordDictionary() {}

  void addWord(String word) {
    if (!_dictionary.containsKey(word.length)) {
      _dictionary[word.length] = [];
    }
    _dictionary[word.length]!.add(word);
  }

  bool search(String word) {
    if (!_dictionary.containsKey(word.length)) return false;
    for (var dictionaryWord in _dictionary[word.length]!) {
      int count = 0;
      for (var i = 0; i < dictionaryWord.length; i++) {
        if (word[i] == '.' || dictionaryWord[i] == word[i]) {
          count++;
        } else {
          break;
        }
      }
      if (count == word.length) return true;
    }
    return false;
  }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * WordDictionary obj = WordDictionary();
 * obj.addWord(word);
 * bool param2 = obj.search(word);
 */

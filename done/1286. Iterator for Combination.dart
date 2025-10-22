class CombinationIterator {
  List<String> _combinations = [];
  CombinationIterator(String characters, int combinationLength) {
    _combinations = _combinationsWithDefinedSize(characters, combinationLength);
  }

  String next() {
    return _combinations.removeAt(0);
  }

  bool hasNext() {
    return _combinations.isNotEmpty;
  }

  List<String> _combinationsWithDefinedSize(
    String characters,
    int combinationLength,
  ) {
    if (combinationLength == 0) return [''];
    if (characters.isEmpty) return [];

    List<String> result = [];
    for (int i = 0; i < characters.length; i++) {
      String currentChar = characters[i];
      String remainingChars = characters.substring(i + 1);
      List<String> subCombinations = _combinationsWithDefinedSize(
        remainingChars,
        combinationLength - 1,
      );
      for (String subCombination in subCombinations) {
        result.add(currentChar + subCombination);
      }
    }
    return result;
  }
}

/**
 * Your CombinationIterator object will be instantiated and called as such:
 * CombinationIterator obj = CombinationIterator(characters, combinationLength);
 * String param1 = obj.next();
 * bool param2 = obj.hasNext();
 */
